<?php

namespace Controllers\Escupitajo;

use Controllers\PrivateController;
use Views\Renderer;
use Utilities\Site;
use Utilities\Validators;
use Utilities\Escupitajo\GenerateCRUD;

class GenerarCrud extends PrivateController
{
  public function run(): void
  {
    $viewData = [];
    Renderer::render("escupitajo/escupitajo", $viewData);
    self::handlePost(); 
  }
  public function handlePost()
  {
    if ($_SERVER["REQUEST_METHOD"] == "POST")
    {
      if (isset($_POST["escupitajobutton"])){
            $tableName = $_POST["nombre_tabla"];
            self::handleExistence($tableName); 
            
        }
    }
  }
  public function handleExistence($tableName)
  {
    if (GenerateCrud::tableExists($tableName))
    {
      self::generate($tableName);
      GenerateCRUD::ShowRoutes($tableName);
    }
  }
  public function generate($tableName)
  {
    
    GenerateCRUD::GenerateFormController($tableName);
    GenerateCRUD::GenerateListController($tableName);
    GenerateCRUD::GenerateFormTemplate($tableName); 
    GenerateCRUD::GenerateListTemplate($tableName);
    GenerateCRUD::GenerateDAO($tableName);
  }
}