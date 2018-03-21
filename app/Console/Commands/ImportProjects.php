<?php

namespace App\Console\Commands;

use App\Project;
use App\Jobs\ImportProject;
use Illuminate\Console\Command;
use Illuminate\Foundation\Inspiring;

class ImportProjects extends Command
{
    /**
     * The name and signature of the console command.
     *
     * @var string
     */
    protected $signature = 'import:projects';

    /**
     * The console command description.
     *
     * @var string
     */
    protected $description = 'Import Projects from their excel files to database';
	
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
		
		$projects = Project::select('id', 'name', 'file_location')->where('file_location', '<>', '')->get();
		foreach($projects as $project){

			$project = dispatch(new ImportProject($project));
			
			$this->comment($project);
		}
		
    }
}
