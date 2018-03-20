<?php

namespace App\Console\Commands;

use Illuminate\Console\Command;
use Illuminate\Foundation\Inspiring;
use DB;
use Excel;

class ImportQueries extends Command
{
    /**
     * The name and signature of the console command.
     *
     * @var string
     */
    protected $signature = 'import:queries {fileUrl?}';

    /**
     * The console command description.
     *
     * @var string
     */
    protected $description = 'Import records from excel to database';
	
    public function __construct()
    {
        parent::__construct();
    }
    /**
     * Execute the console command.
     *
     * @return mixed
     */
    public function handle()
    {		
		$fileUrl = $this->argument('fileUrl');
		
		if($fileUrl){
			if(!substr($fileUrl, 0, 1) == '/'){
				$fileUrl = '/'.$fileUrl;
			}
			
			$file = basename($fileUrl);
			list($name, $extension) = explode(".", $file);
			
			if($extension == "xlsx" or $extension == "csv"){ //Check File Type
				$data = Excel::selectSheets('Stock Items Available for Sale')->load($fileUrl)->all();
				$data = $data->toArray();
				
				if($data) {
					$distinct_projects = \DB::table('projects')->select('id')
								->where('file_location', $fileUrl)
								->get();
					if($distinct_projects){
						foreach ($distinct_projects as  $distinct_project){
							$project_stages_arr = [];
							$project_stages = \DB::table('sections')->select('id')->where('project_id', $distinct_project->id)->get();
							foreach($project_stages as $project_stage){
								$project_stages_arr[] = $project_stage->id;
							}
							$old_properties = \DB::table('properties')->wherein('section_id', $project_stages_arr)->delete();
						}		
					}		

					$count = 0;	
					foreach($data as $row){
						// GET Project
						$project = \DB::table('projects')->select('id')
									->where('name', $row['estate'])
									->where('file_location', $fileUrl)
									->first();

						if(!$project){ // Add new Project if not found.
							$project_id = \DB::table('projects')->insertGetId(
								[
									'name' => $row['estate'], 
									'uid' => str_replace(' ', '-', strtolower($row['estate'])), 
									'file_location' => $fileUrl,
									'project_type' => 'estate'
								]
							);			
						}else {
							$project_id = $project->id;
						}

						$stage = \DB::table('sections')->select('id')
									->where('name', $row['stage'])
									->where('project_id', $project_id)
									->first();

						if( !$stage ){ //Add new Stage if not found.
							$stage_id = \DB::table('sections')->insertGetId(
								[
									'name' => $row['stage'], 
									'uid' => str_replace(' ', '-', strtolower($row['stage'])), 
									'project_id' => $project_id
								]
							);		
						} else {
							$stage_id = $stage->id;
						}			

						$status = \DB::table('statuses')->select('id')
									->where('description', $row['inventory_status'])
									->where('project_id', $project_id)
									->first();

						if( !$status ){ //Add new Status if not found.
							$status_id = \DB::table('statuses')->insertGetId(
								[
									'description' => $row['inventory_status'], 
									'project_id' => $project_id
								]
							);		
						} else {
							$status_id = $status->id;
						}


						$custom_fields = [
							[
								md5($row['frontage_m']) => $row['frontage_m']
							],
							[
								md5($row['bathrooms_incl_ensuite_old']) => $row['bathrooms_incl_ensuite_old']
							],
							[
								md5($row['bedrooms_old']) => $row['bedrooms_old']
							]
						];

						$property = \DB::table('properties')->insert(
							[
								'name' => $row['name'], 
								'area' => $row['area_m2'], 
								'section_id' => $stage_id,
								'status_id' => $status_id,
								'via_import' => 1,
								'custom_fields' => json_encode($custom_fields),
								'lot_id' => $row['lot_number']
							]
						);

						$count++;
					}
					
					$this->comment('Done Importing '.$count.' Properties successfully');
				}				
			}			
		}else{
			$this->comment('Please add your xlsx/csv file location at the end of the command.');
		}
    }
}
