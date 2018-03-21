<?php

namespace App\Jobs;

use App\Jobs\Job;
use App\Project;
use App\Section;
use App\Property;
use App\Status;

use Excel;
use Illuminate\Contracts\Bus\SelfHandling;

class ImportProject extends Job implements SelfHandling
{
	
	protected $project;
    /**
     * Create a new job instance.
     *
     * @return void
     */
    public function __construct($project)
    {
        $this->project = $project;
    }

    /**
     * Execute the job.
     *
     * @return void
     */
    public function handle()
    {
        $project = $this->project;
		$projectId = $project->id;
		$fileUrl = $project->file_location;
		$lotsNumbers = [];
		$sectionsIds = [];
		$count = 0;
		
		$excelData = Excel::selectSheets('Stock Items Available for Sale')->load($fileUrl)->all();
		$excelData = $excelData->toArray();
		
		if($excelData) {
			foreach($excelData as $excelRow){
				$sectionId = $this->findOrCreateSection($projectId, $excelRow['stage']);
				$statusId = $this->findOrCreateStatus($projectId, $excelRow['inventory_status']);
				
				$customFields = [
					[ md5($excelRow['frontage_m']) => $excelRow['frontage_m'] ],
					[ md5($excelRow['bathrooms_incl_ensuite_old']) => $excelRow['bathrooms_incl_ensuite_old'] ],
					[ md5($excelRow['bedrooms_old']) => $excelRow['bedrooms_old'] ]
				];
				
				$property = Property::firstOrNew([ 
					'lot_id' => $excelRow['lot_number'],
					'section_id' => $sectionId
				]);
				$property->name = $excelRow['name']; 
				$property->area = $excelRow['area_m2']; 
				$property->section_id = $sectionId;
				$property->status_id = $statusId;
				$property->via_import = 1;
				$property->custom_fields = json_encode($customFields);
				$property->lot_id = $excelRow['lot_number'];
				$property->save();
				
				$lotsNumbers[] = $property->lot_id;
				$sectionsIds[] = $sectionId;
				$count++;
			}
			
			Property::wherein('section_id', array_unique($sectionsIds))
									->whereNotIn('lot_id', $lotsNumbers)
									->delete();
			
			return 'Done Importing '.$count.' Properties for '.$project->name;
		}
					
    }
	
    /**
     * Find or create new Section then return it's Id.
     *
     */
	public function findOrCreateSection($projectId, $stageName)
	{
		$section = Section::firstOrCreate(
			[ 'project_id' => $projectId, 'name' => $stageName ]
		);

		return $section->id;
	}
	
    /**
     * Find or create new Status then return it's Id.
     *
     */
	public function findOrCreateStatus($projectId, $inventoryStatus)
	{
		$status = Status::firstOrCreate(
			['project_id' => $projectId, 'description' => $inventoryStatus]
		);
		return $status->id;
	}
	
}
