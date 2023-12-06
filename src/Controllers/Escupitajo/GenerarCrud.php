<?php

namespace Controllers\Escupitajo;

use Controllers\PrivateController;
use Controllers\PublicController;
use Views\Renderer;
use Utilities\Site;
use Utilities\Validators;
use Utilities\Escupitajo\GenerateCRUD;

class GenerarCrud extends PrivateController
{
  public function run(): void
  {
    $dataview = [];
    $dataview['isCLN'] = \Dao\Security\Security::userIs($_SESSION['useremail'],'CLN'); 
    $dataview['isCLS'] = \Dao\Security\Security::userIs($_SESSION['useremail'],'CLS'); 
    $dataview['isADMIN'] = \Dao\Security\Security::userIs($_SESSION['useremail'],'ADMIN');
    $dataview['isCLN'] = \Dao\Security\Security::userIs($_SESSION['useremail'],'CLN'); 
    $dataview['isCLS'] = \Dao\Security\Security::userIs($_SESSION['useremail'],'CLS'); 
    $dataview['isADMIN'] = \Dao\Security\Security::userIs($_SESSION['useremail'],'ADMIN');  
    Renderer::render("escupitajo/escupitajo", $dataview);
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