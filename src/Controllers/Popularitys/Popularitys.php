<?php

namespace Controllers\Popularitys;

use Controllers\PrivateController;
use Views\Renderer;
use Dao\Popularitys\Popularitys as DAOPopularity;
use Utilities\Site;
use Utilities\Validators;

class Popularitys extends PrivateController
{
    private $id_popularity;
    private $id_object;
    private $dislike_count;
    private $like_count;
    private $percent_dislike;
    private $percent_like;
    private $type_object;
    private $popularity = [
        "id_popularity" => "",
        "id_object" => "",
        "dislike_count" => "",
        "like_count" => "",
        "percent_dislike" => "",
        "percent_like" => "",
        "type_object" => ""
    ];
    private $listUrl = "index.php?page=Popularitys_Popularity";
    private $mode = 'INS';
    private $viewData = [];
    private $error = [];
    private $xss_token_popularity = '';
    private $modes = [
        "INS" => "Creando nueva popularity",
        "UPD" => "Editando popularity",
        "DEL" => "Eliminando popularity",
        "DSP" => "Detalle popularity"
    ];

    public function run(): void
    {
        $this->init();
        if ($this->isPostBack()) {
            if ($this->validateFormData()) {
                $this->popularity['id_popularity'] = $_POST['id_popularity'];
                $this->popularity['id_object'] = $_POST['id_object'];
                $this->popularity['dislike_count'] = $_POST['dislike_count'];
                $this->popularity['like_count'] = $_POST['like_count'];
                $this->popularity['percent_dislike'] = $_POST['percent_dislike'];
                $this->popularity['percent_like'] = $_POST['percent_like'];
                $this->popularity['type_object'] = $_POST['type_object'];
                $this->processAction();
            }
        }
        $this->prepareViewData();
        $this->render();
    }
    private function init()
    {
        if (isset($_GET["mode"])) {
            if (isset($this->modes[$_GET["mode"]])) {
                $this->mode = $_GET["mode"];
                if ($this->mode !== "INS") {
                    if (isset($_GET["id_popularity"])) {
                        $this->popularity = DAOPopularity::obtenerPorId(strval($_GET["id_popularity"]));
                    }
                }
            } else {
                $this->handleError("Oops, el programa no encuentra el modo solicitado, intente de nuevo");
            }
        } else {
            $this->handleError("Oops, el programa falló, intente de nuevo.");
        }
    }
    private function handleError($errMsg)
    {
        Site::redirectToWithMsg($this->listUrl, $errMsg);
    }

    private function validateFormData()
    {
        if (isset($_POST["xss_token_popularity"])) {
            $this->xss_token_popularity = $_POST["xss_token_popularity"];
            if ($_SESSION["xss_token_popularity"] !== $this->xss_token_popularity) {
                $this->handleError("Error al procesar la peticion");
                return false;
            }
        } else {
            $this->handleError("Error al procesar la peticion");
            return false;
        }
        if (Validators::IsEmpty($_POST["id_popularity"])) {
            $this->error["id_popularity_error"] = "Campo es requerido";
        }
        if (Validators::IsEmpty($_POST["id_object"])) {
            $this->error["id_object_error"] = "Campo es requerido";
        }
        if (Validators::IsEmpty($_POST["dislike_count"])) {
            $this->error["dislike_count_error"] = "Campo es requerido";
        }
        if (Validators::IsEmpty($_POST["like_count"])) {
            $this->error["like_count_error"] = "Campo es requerido";
        }
        if (Validators::IsEmpty($_POST["percent_dislike"])) {
            $this->error["percent_dislike_error"] = "Campo es requerido";
        }
        if (Validators::IsEmpty($_POST["percent_like"])) {
            $this->error["percent_like_error"] = "Campo es requerido";
        }
        if (Validators::IsEmpty($_POST["type_object"])) {
            $this->error["type_object_error"] = "Campo es requerido";
        }
        //if (!in_array($_POST["status"], ["INA", "ACT"])) {
        // $this->error["status_error"] = "Estado es inválido.";
        // } else {
        //  $this->error["status_error"] = ""; 
        //}

        return count($this->error) == 0;
    }

    private function processAction()
    {
        switch ($this->mode) {
            case 'INS':
                if (DAOPopularity::insertPopularity(
                    $this->popularity["id_popularity"],
                    $this->popularity["id_object"],
                    $this->popularity["dislike_count"],
                    $this->popularity["like_count"],
                    $this->popularity["percent_dislike"],
                    $this->popularity["percent_like"],
                    $this->popularity["type_object"]
                )) {
                    Site::redirectToWithMsg($this->listUrl, "Popularity creada exitosamente.");
                } else {
                    Site::redirectToWithMsg($this->listUrl, "Hubo un error.");
                }
                break;
            case 'UPD':
                if (DAOPopularity::updatePopularity(
                    $this->popularity["id_popularity"],
                    $this->popularity["id_object"],
                    $this->popularity["dislike_count"],
                    $this->popularity["like_count"],
                    $this->popularity["percent_dislike"],
                    $this->popularity["percent_like"],
                    $this->popularity["type_object"]
                )) {
                    Site::redirectToWithMsg($this->listUrl, "Popularity actualizada exitosamente.");
                } else {
                    Site::redirectToWithMsg($this->listUrl, "Hubo un error.");
                }
                break;
            case 'DEL':
                if (DAOPopularity::deletePopularity(
                    $this->popularity["id_popularity"]
                )) {
                    Site::redirectToWithMsg($this->listUrl, "Popularity eliminada exitosamente.");
                } else {
                    Site::redirectToWithMsg($this->listUrl, "Hubo un error.");
                }
                break;
        }
    }


    private function prepareViewData()
    {
        $this->viewData["mode"] = $this->mode;
        $this->viewData["popularity"] = $this->popularity;
        if ($this->mode == "INS") {
            $this->viewData["modedsc"] = $this->modes[$this->mode];
            $this->viewData['isCLN'] = \Dao\Security\Security::userIs($_SESSION['useremail'], 'CLN');
            $this->viewData['isADMIN'] = \Dao\Security\Security::userIs($_SESSION['useremail'], 'ADMIN');
            $this->viewData['isCLS'] = \Dao\Security\Security::userIs($_SESSION['useremail'], 'CLS');
        } else {
        }
        //$this->viewData["popularity"][$this->popularity["status"]."_selected"] = 'selected';
        foreach ($this->error as $key => $error) {
            if ($error !== null) {
                $this->viewData["popularity"][$key] = $error;
            }
        }
        $this->viewData["readonly"] = in_array($this->mode, ["DSP", "DEL"]) ? 'readonly' : '';
        $this->viewData["showConfirm"] = $this->mode !== "DSP";
        $this->xss_token_popularity = md5("popularitys_popularity" . date('Ymdhisu'));
        $_SESSION["xss_token_popularity"] = $this->xss_token_popularity;
        $this->viewData["xss_token_popularity"] = $this->xss_token_popularity;
    }


    private function render()
    {
        $this->viewData['isCLN'] = \Dao\Security\Security::userIs($_SESSION['useremail'], 'CLN');
        $this->viewData['isADMIN'] = \Dao\Security\Security::userIs($_SESSION['useremail'], 'ADMIN');
        $this->viewData['isCLS'] = \Dao\Security\Security::userIs($_SESSION['useremail'], 'CLS');
        Renderer::render("popularitys/popularityform", $this->viewData);
    }
}