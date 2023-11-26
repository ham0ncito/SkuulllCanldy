<?php

namespace Utilities\Escupitajo;

use Dao\Table;

class GenerateCRUD extends Table
{
    public $name;

    private static function GetName($name)
    {
        $string = strtolower($name);
        return $string;
    }
    private static function getRoute($tableName, $code)
    {
        if (!$code = "1") {
            return ucfirst($tableName) . "s_" . ucfirst($tableName) . "s";
        }
        return ucfirst($tableName) . "s_" . ucfirst($tableName);
    }
    private static function getRoutes($tableName)
    {
        $lowerName = strtolower($tableName);
        $names = ucfirst($lowerName);
        $urls = [
            "../Controllers/{$names}s/",
            "../Controllers/{$names}s/{$names}s.php",
            "../Controllers/{$names}s/{$names}.php",
            "../Dao/{$names}s/",
            "../Dao/{$names}s/{$names}s.php",
            "../views/templates/",
            "../views/templates/{$lowerName}s/{$lowerName}list.view.tpl",
            "../views/templates/{$lowerName}s/{$lowerName}form.view.tpl"
        ];
        return $urls;
    }
    public static function ShowRoutes($tableName)
    {
        $urls = self::getRoutes($tableName);
        echo '<script>alert("Revisa las rutas creadas más abajo");</script>';
        echo '<div class="bg-gray-100 p-4 rounded-md shadow-md">';
        echo '<h2 class="text-xl font-bold mb-2">Rutas creadas:</h2>';
        foreach ($urls as $url) {
            echo '<p class="mb-2">' . $url . '</p>';
        }
        echo '</div>';
    }
    public static function tableExists($tableName)
    {
        $tableName = self::GetName($tableName);
        $QueryString = "DESC $tableName";
        $registros = self::obtenerRegistros($QueryString, []);
        if (!empty($registros)) {
            return true;
        } else {
            return false;
        }
    }
    private static function getData($tableName)
    {
        $tableName = self::GetName($tableName);
        $QueryString = "DESC $tableName";
        $registros = self::obtenerRegistros($QueryString, []);
        return $registros;
    }

    private static function getFields($tableName)
    {
        $data = self::getData($tableName);
        if (!empty($data)) {
            $position = 0;
            foreach ($data as $campo) {
                $fields[$position] = $campo['Field'];
                $position++;
            }
        }
        return $fields;
    }
    private static function getFieldsString($tableName)
    {
        $fields = self::getFields($tableName);
        $fieldsString = '';

        if (!empty($fields)) {
            $position = 0;
            foreach ($fields as $campo) {
                $fieldsString .= $campo;
                if ($position < count($fields) - 1) {
                    $fieldsString .= ', ';
                }
                $position++;
            }
        }

        return $fieldsString;
    }
    private static function getFieldsStringWithDollar($tableName)
    {
        $fields = self::getFields($tableName);
        $fieldsString = '';

        if (!empty($fields)) {
            $position = 0;
            foreach ($fields as $campo) {
                $fieldsString .= "\$". $campo;
                if ($position < count($fields) - 1) {
                    $fieldsString .= ', ';
                }
                $position++;
            }
        }

        return $fieldsString;
    }
    private static function getParams($tableName)
    {
        $fields = self::getFields($tableName);
        $string = "";
        if (!empty($fields)) {
            $position = 0;
            foreach ($fields as $campo) {
                $string .= "'$campo' => " . '$' . $campo;
                if ($position < count($fields) - 1) {
                    $string .= ', ';
                }
                $position++;
            }
        }
        return $string;
    }

    private static function getFieldsStringForVariable($tableName)
    {
        $fields = self::getFields($tableName);
        $fieldsString = '';

        if (!empty($fields)) {
            $position = 0;
            foreach ($fields as $campo) {
                $fieldsString .= "$" . $campo;
                if ($position < count($fields) - 1) {
                    $fieldsString .= ', ';
                }
                $position++;
            }
        }

        return $fieldsString;
    }
    private static function getFieldsForUpdate($tableName)
    {
        $fields = self::getFields($tableName);
        $fieldsString = '';
        if (!empty($fields)) {
            $position = 0;
            foreach ($fields as $campo) {
                $fieldsString .= $campo . " = :{$campo}";
                if ($position < count($fields) - 1) {
                    $fieldsString .= ', ';
                }
                $position++;
            }
        }
        return $fieldsString;
    }
    private static function getFieldsForInsert($tableName)
    {
        $fields = self::getFields($tableName);
        $fieldsString = '';
        if (!empty($fields)) {
            $position = 0;
            foreach ($fields as $campo) {
                $fieldsString .= ":{$campo}";
                if ($position < count($fields) - 1) {
                    $fieldsString .= ' , ';
                }
                $position++;
            }
        }

        return $fieldsString;
    }

    private static function getFieldFormString($tableName)
    {
        $fields = self::getFields($tableName);
        $fieldsString = '';

        if (!empty($fields)) {

            foreach ($fields as $campo) {

                $fieldsString .= "\t\t\t\t\t\t     \$this->" . strtolower($tableName) . "['" . strtolower($campo) . "'] = \$_POST['" . strtolower($campo) . "'];\n";
            }
        }
        return $fieldsString;
    }
    private static function getFieldsInitializer($tableName)
    {
        $fields = self::getFields($tableName);
        $types = self::getType($tableName);
        $fieldsString = '';

        if (!empty($fields)) {
            $position = 0;
            foreach ($fields as $campo) {
                $fieldsString .= '"' . strtolower($campo) . '" => ';
                if ($types[$position] == 'VARCHAR' || $types[$position] == 'CHAR') {
                    $fieldsString .= '""';
                } elseif ($types[$position] == 'INT' || $types[$position] == 'BIGINT') {
                    $fieldsString .= '0';
                } elseif ($types[$position] == 'BOOLEAN') {
                    $fieldsString .= 'true';
                } else {
                    $fieldsString .= '""';
                }
                if ($position < count($fields) - 1) {
                    $fieldsString .= ', ' . "\n\t\t";
                }
                $position++;
            }
        }
        $fieldsString .= "\n];\n\t " . 'private $listUrl = "index.php?page=' . self::getRoute($tableName, "1") . '";';
        $fieldsString .= "\n\t private \$mode = 'INS';
    private \$viewData = [];
    private \$error = [];
    private \$xss_token_".strtolower($tableName)." = '';";
        $fieldsString .= "\n" . 'private $modes = [
            "INS" => "Creando nueva ' . $tableName . '",
            "UPD" => "Editando ' . $tableName . '",
            "DEL" => "Eliminando ' . $tableName . '",
            "DSP" => "Detalle ' . $tableName . '"
        ];';
        return $fieldsString;
    }

    private static function getType($tableName)
    {
        $data = self::getData($tableName);
        if (!empty($data)) {
            $position = 0;
            foreach ($data as $campo) {
                $fields[$position] = $campo['Type'];
                $position++;
            }
        }
        return $fields;
    }
    private static function generateFolder($fields, $prefix)
    {
        $ruta = "{$prefix}{$fields}s/";
        if (!is_dir($ruta)) {
            if (mkdir($ruta, 0755, true)) {
            }
        }
        return $ruta;
    }
    public static function GenerateFormController($fields)
    {
        $fields = ucfirst($fields);
        $ruta = self::generateFolder($fields, "src/Controllers/");
        $file_path = "{$ruta}{$fields}s.php";
        $fieldsContent = self::generateVariables($fields);
        $uses = self::generateNamespace($fields);
        $variables = self::generateArrayForm($fields);
        $run = self::generateRunForForm(strtolower($fields));
        $init = self::generateInit($fields);
        $validator = self::generateValidateFormData($fields);
        $process = self::processAction($fields);
        $viewData = self::generatePrepareViewData($fields);
        $render = self::generateRender($fields);
        $file_content = '<?php' . PHP_EOL . "namespace Controllers\\{$fields}s;\n{$uses}\nclass {$fields}s extends PublicController {\n{$fieldsContent}{$variables}{$run}{$init}{$validator}{$process}{$viewData}{$render}\n}" . PHP_EOL;
        file_put_contents($file_path, $file_content);
    }
    private static function generateNamespace($fields)
    {
        $string = "use Controllers\PublicController;\nuse Views\Renderer;\nuse Dao\\{$fields}s\\{$fields}s as DAO{$fields};\nuse Utilities\Site;\nuse Utilities\Validators;";
        return $string;
    }
    private static function generateRun($fields, $sufix)
    {
        $viewDataField = self::generateViewData($fields);
        $string = "
    public function run(): void
    {
        Site::addLink('{$fields}_style');
        {$viewDataField}
        Renderer::render(\"{$fields}s/{$fields}{$sufix}\", \$viewData);
    }";
        return $string;
    }

    private static function generateRunForForm($tableName)
    {
        $string = "
        public function run(): void
        {
            \$this->init();
             if (\$this->isPostBack()){
                 if(\$this->validateFormData()){\n" .
            self::getFieldFormString($tableName) . "\t\t\t      \$this->processAction();
           }
        }
        \$this->prepareViewData();
        \$this->render();
        }";
        return $string;
    }
    private static function generateInit($tableName)
    {
        $string = "\n\t\t" . "private function init()
        {
            if (isset(\$_GET[" . '"mode"' . "])) {
                if (isset(\$this->modes[\$_GET[" . '"mode"' . "]])) {
                    \$this->mode = \$_GET[" . '"mode"' . "];
                    if(\$this->mode !== " . '"INS"' . ") {
                        if (isset(\$_GET[" . '"' . self::getPrimaryKey($tableName) . '"' . "])){
                            \$this->" . strtolower($tableName) . " = DAO" . ucfirst($tableName) . "::obtenerPorId(strval(\$_GET[" . '"' . self::getPrimaryKey($tableName) . '"' . "]));
                            if (!\$this->". strtolower($tableName) .") {
                                \$this->handleError(" . '"Oops, no sé encontro"' . ");
                              }
                        }
                    }
                } else {
                    \$this->handleError(" . '"Oops, el programa no encuentra el modo solicitado, intente de nuevo"' . ");
                }
            } else {
                \$this->handleError(" . '"Oops, el programa falló, intente de nuevo."' . ");
            }
        }";
        $string .= "\n\t\tprivate function handleError(\$errMsg){
            Site::redirectToWithMsg(\$this->listUrl, \$errMsg);
        }" . "\n";
        return $string;
    }

    private static function generateValidateFormData($tableName)
    {
        $string = "\n\t\t" . 'private function validateFormData(){
        if(isset($_POST["xss_token_'. strtolower($tableName) . '"])) {
            $this->xss_token_' . strtolower($tableName) . ' = $_POST["xss_token_' . strtolower($tableName) . '"];
            if( $_SESSION["xss_token_' . strtolower($tableName) . '"] !== $this->xss_token_'. strtolower($tableName) . ') {
                $this->handleError("Error al procesar la peticion");
                return false;
            }
        } else {
            $this->handleError("Error al procesar la peticion");
            return false;
        }' . self::generateValidators($tableName) . '
        //if (!in_array($_POST["status"], ["INA", "ACT"])) {
           // $this->error["status_error"] = "Estado es inválido.";
       // } else {
          //  $this->error["status_error"] = ""; 
        //}
        
        return count($this->error) == 0;
    }' . "\n";
        return $string;
    }
    private static function generateValidators($tableName)
    {
        $fields = self::getFields($tableName);
        $fieldsString = '';

        if (!empty($fields)) {
            $position = 0;
            foreach ($fields as $campo) {
                $fieldsString .= 'if(Validators::IsEmpty($_POST["' . strtolower($campo) . '"])){
                 $this->error["' . strtolower($campo) . '_error"] = "Campo es requerido";
                }';
                $position++;
            }
        }

        return $fieldsString;
    }

    private static function generateThis($tableName)
    {
        $fields = self::getFields($tableName);
        $string = "";
        if (!empty($fields)) {
            $position = 0;
            foreach ($fields as $campo) {
                $string .= "\$this -> " . strtolower($tableName) . '["' . strtolower($campo) . '"]';
                if ($position < count($fields) - 1) {
                    $string .= ",\n";
                }
                $position++;
            }
        }
        return $string;
    }

    private static function processAction($tableName)
    {
        $sql = "\n\t" . 'private function processAction(){
        switch ($this->mode) {
            case \'INS\':
               if ( DAO' . ucfirst($tableName) . '::insert' . ucfirst($tableName) . '(
                       ' . self::generateThis($tableName) . '
                    )
                ) {
                    Site::redirectToWithMsg($this->listUrl, "' . ucfirst($tableName) . ' creada exitosamente.");
                } else
                {
                    Site::redirectToWithMsg($this->listUrl, "Hubo un error.");
                }
                break;
            case \'UPD\':
                if ( DAO' . ucfirst($tableName) . '::update' . ucfirst($tableName) . '(
                    ' . self::generateThis($tableName) . '
                    )
                ) {
                    Site::redirectToWithMsg($this->listUrl, "' . ucfirst($tableName) . ' actualizada exitosamente.");
                }else
                {
                    Site::redirectToWithMsg($this->listUrl, "Hubo un error.");
                }
                break;
            case \'DEL\':
                if ( DAO' . ucfirst($tableName) . '::delete' . ucfirst($tableName) . '(
                    $this->' . strtolower($tableName) . '["' . self::getPrimaryKey($tableName) . '"]
                )
            ) {
                Site::redirectToWithMsg($this->listUrl, "' . ucfirst($tableName) . ' eliminada exitosamente.");
            }else
            {
                Site::redirectToWithMsg($this->listUrl, "Hubo un error.");
            }
                break;
        }
    }
      ' . "\n";
        return $sql;
    }
    private static function generatePrepareViewData($tableName)
    {
        $string = "\n\t" . ' private function prepareViewData(){
            $this->viewData["mode"] = $this->mode;
            $this->viewData["' . strtolower($tableName) . '"] = $this->' . strtolower($tableName) . ';
            if ($this->mode == "INS") {
                $this->viewData["modedsc"] = $this->modes[$this->mode];
            } else {
                //$this->viewData["modedsc"] = sprintf(
                   // $this->modes[$this->mode], 
                //);
            }
            //$this->viewData["' . strtolower($tableName) . '"][$this->' . strtolower($tableName) . '["status"]."_selected"] = \'selected\';
            foreach ($this->error as $key => $error) {
                if ($error !== null) {
                    $this->viewData["' . strtolower($tableName) . '"][$key] = $error;
                }
            }
            $this->viewData["readonly"] = in_array($this->mode, ["DSP","DEL"]) ? \'readonly\': ' . "''" . ';
            $this->viewData["showConfirm"] = $this->mode !== "DSP"; 
            $this->xss_token_'. strtolower($tableName) . ' = md5("' . strtolower(self::getRoute($tableName, "1")) . '".date(\'Ymdhisu\'));
            $_SESSION["xss_token_' . strtolower($tableName) . '"] = $this->xss_token_'.strtolower($tableName) . ';
            $this->viewData["xss_token_' . strtolower($tableName) . '"] = $this->xss_token_'.strtolower($tableName) . '; 
        }
        ' . "\n";
        return $string;
    }
    private static function generateRender($tableName)
    {
        $string = "\n\t" . 'private function render(){
            Renderer::render("' . strtolower($tableName) . 's/' . strtolower($tableName) . 'form", $this->viewData);
        }';
        return $string;
    }


    private static function generatevalidate($tableName)
    {
        $tableName = strtolower($tableName);
        $forms = self::getFieldFormString($tableName);
        $string = $forms;
        return $string;
    }
    private static function generateViewData($tableName)
    {
        $fields = self::getFields($tableName);
        $fieldsString = '';
        if (!empty($fields)) {
            $position = 0;
            foreach ($fields as $campo) {
                $fieldsString .= "\$viewData['{$campo}'] = '{$campo}';\n\t\t";
                $position++;
            }
        }
        $fieldsString .= "\$viewData['" . strtolower($tableName) . "']= DAO" . ucfirst($tableName) . "::get" . ucfirst($tableName) . "();";

        return $fieldsString;
    }

    private static function generateArrayForm($tableName)
    {
        $tableName = strtolower($tableName);
        $string = "  private \${$tableName} = [\n\t" . self::getFieldsInitializer($tableName) . "\n";
        return $string;
    }

    private static function generateInput($tableName)
    {
        $fields = self::getFields($tableName);
        $fieldsString = '';

        if (!empty($fields)) {
            $position = 0;

            foreach ($fields as $campo) {
                $fieldsString .= '<section class="mb-4">
                <label for="' . strtolower($campo) . '" class="block text-gray-700 text-sm font-bold mb-2">' . strtolower($campo) . '</label>
                <input type="text" id="' . strtolower($campo) . '" name="' . strtolower($campo) . '" placeholder="' . strtolower($campo) . ' de ' . $tableName . ' " value="{{' . strtolower($campo) . '}}" {{if ~readonly}} disabled readonly {{endif ~readonly}} class="w-full py-2 px-3 border border-gray-300 rounded focus:outline-none focus:border-blue-400"/>
                {{if ' . strtolower($campo) . '_error}}<div class="text-red-500 text-sm">{{' . strtolower($campo) . '_error}}</div>{{endif ' . strtolower($campo) . '_error}}
            </section>';
                $position++;
            }
        }
        $fieldsString .= '<section class="col-12 right">
        {{if ~showConfirm}}
            <button type="submit" name="btnConfirm">Confirm</button>&nbsp;
        {{endif ~showConfirm}}
        <button id="btnCancel">Cancel</button>
        </section>
        </section>';
        return $fieldsString;
    }
    private static function generateFormHeader($fields)
    {
        $string = '<section class="bg-gray-100 p-4 mx-4">
    <h1 class="text-2xl font-bold mb-4"> Descripcion ' . $fields . ' {{modedsc}}</h1>
    '."\n".'{{with '. strtolower($fields).'}}'."\n".'
    <form class="my-4 bg-white p-8 rounded shadow-lg mx-auto max-w-md" action="index.php?page=' . self::getRoute($fields, "0") . 's&mode={{~mode}}&' . self::getPrimaryKey($fields) . '={{id}}" method="POST">';
        $string .= '<input type="hidden" name="xss_token_' . strtolower($fields) . '" value="{{~xss_token_'.strtolower($fields).'}}"/>';
        return $string;
    }

    private static function generateVariables($tableName)
    {
        $fields = self::getFields($tableName);
        $string = "";

        foreach ($fields as $field) {
            $string .= "\x20\x20private $" . $field . ";\n";
        }

        return $string;
    }

    public static function GenerateListController($fields)
    {
        $fields = ucfirst($fields);
        $ruta = self::generateFolder($fields, "src/Controllers/");
        $file_path = "{$ruta}{$fields}.php";
        $fieldsContent = self::generateVariables($fields);
        $uses = self::generateNamespace($fields);
        $run = self::generateRun(strtolower($fields), "list");
        $file_content = '<?php' . PHP_EOL . "namespace Controllers\\{$fields}s;\n{$uses}\nuse Utilities\Context;\nuse Utilities\Paging;\nclass {$fields} extends PublicController {\n{$fieldsContent}{$run}\n}" . PHP_EOL;
        file_put_contents($file_path, $file_content);
    }
    public static function GenerateListTemplate($fields)
    {
        $fields = strtolower($fields);
        $ruta = self::generateFolder($fields, "src/Views/templates/");
        $file_path = "{$ruta}{$fields}list.view.tpl";
        $file_content = self::generateList($fields);
        file_put_contents($file_path, $file_content);
    }
    public static function GenerateFormTemplate($fields)
    {
        $normal = $fields;
        $fields = strtolower($fields);
        $ruta = self::generateFolder($fields, "src/Views/templates/");
        $file_path = "{$ruta}{$fields}form.view.tpl";
        $files = self::getFields($normal);
        $file_content = self::generateForm($fields);
        file_put_contents($file_path, $file_content);
    }
    private static function generateScript($tableName)
    {
        $script = "\n" . '<script>
        document.addEventListener("DOMContentLoaded", ()=>{
            document.getElementById("btnCancel").addEventListener("click", (e)=>{
                e.preventDefault();
                e.stopPropagation();
                document.location.assign("index.php?page=' . self::getRoute($tableName, "1") . '");
            });
        });
    </script>';
        return $script;
    }
    private static function generateForm($fields)
    {
        $string = self::generateFormHeader($fields) . self::generateInput($fields) . '</form></section>'."\n".'{{endwith ' . strtolower($fields).'}}'."\n";
        $string .= self::generateScript($fields);
        return $string;
    }
    private static function generateList($fields)
    {
        $string = self::generateListHeader($fields) . self::generateListTHEAD($fields) . self::generateListBody($fields) . "\n" . '</table>' . "\n" . '</div> </section>';
        return $string;
    }
    private static function generateListTHEAD($tableName)
    {
        $fields = self::getFields($tableName);
        $fieldsString = '';

        if (!empty($fields)) {
            $position = 0;

            foreach ($fields as $campo) {
                $fieldsString .= "\n\t" . '<th class="py-2 px-4 border-b">' . strtoupper($campo) . '</th>';
                $position++;
            }
            $fieldsString .= '<th><a href="index.php?page=' . self::getRoute($tableName, "0") . 's&mode=INS">Nuevo</a></th>';
            $fieldsString .= "\n\t</tr>\n</thead>";
        }
        return $fieldsString;
    }
    private static function generateListBody($tableName)
    {
        $fields = self::getFields($tableName);
        $fieldsString = '<tbody>{{foreach ' . strtolower($tableName) . '}}<tr>';
        if (!empty($fields)) {
            foreach ($fields as $campo) {
                $fieldsString .= '<td class="p-2 text-center"><a class="text-blue-500 hover:text-blue-700" href="index.php?page=' . self::getRoute($tableName, "0") . 's&mode=DSP&' . self::getPrimaryKey($tableName) . '={{' . self::getPrimaryKey($tableName) . '}} ">{{' . strtolower($campo) . '}}</a></td>';
            }
            $fieldsString .= '
            <td class"p-2 text-center">
                <a class="text-green-500 hover:text-green-700" href="index.php?page=' . self::getRoute($tableName, "0") . 's&mode=UPD&' . self::getPrimaryKey($tableName) . '={{' . self::getPrimaryKey($tableName) . '}}" >Edit</a> 
                <a class="text-red-500 hover:text-red-700" href="index.php?page=' . self::getRoute($tableName, "0") . 's&mode=DEL&' . self::getPrimaryKey($tableName) . '={{' . self::getPrimaryKey($tableName) . '}}" >Delete</a>
            </td>';
            $fieldsString .= "\n\t</tr>\n {{endfor " . strtolower($tableName) . "}}</tbody>";
        }
        return $fieldsString;
    }


    private static function generateListHeader($fields)
    {
        $string = '<section><h2 class="text-2xl font-bold mb-4"> LISTADO DE ' . strtoupper($fields) . '</h2>' . "\n" . '<div class="overflow-x-auto">' . "\n" . '<table class="min-w-full bg-white border border-gray-300">' . "\n" . '<thead>' . "\n" . '<tr>';
        return $string;
    }
    public static function GenerateDAO($fields)
    {
        $fields = ucfirst($fields);
        $ruta = self::generateFolder($fields, "src/Dao/");
        $file_path = "{$ruta}{$fields}s.php";
        $string = self::GenerateHEADERDA0($fields);
        $file_content = $string;

        file_put_contents($file_path, $file_content);
    }
    private static function GenerateHEADERDA0($fields)
    {
        $lower = $fields;
        $id = '$id';
        $variables = self::getFieldsStringForVariable($fields);
        $get = self::generateGet(strtolower($fields));
        $update = self::generateUpdate(strtolower($fields));
        $delete = self::generateDelete(strtolower($fields));
        $insert = self::generateInsert(strtolower($fields));
        $obtenerporid = self::generateObtenerPorId(strtolower($fields));
        $fields = ucfirst($fields);
        $columns = self::generateVariables($fields);
        $string = "<?php
namespace Dao\\{$fields}s; 
use Dao\Table; 
class {$fields}s extends Table{
    \r{$columns}
 \n  public static function get{$fields}(){\n\t{$get}\n\t}\n\n  public static function insert{$fields}({$variables}){\n\t{$insert}\n\t}\n\n  public static function update{$fields}({$variables}){\n\t{$update}\n\t}\n\n public static function obtenerPorId($id){\n\t{$obtenerporid}\n\t}\n\n public static function delete{$fields}($id){\n\t{$delete}\n\t}
    \n}";
        return $string;
    }
    private static function generateInsert($fields)
    {
        $values = self::getFieldsForInsert($fields);
        $primaryKey = self::getPrimaryKey($fields);
        $params = self::getParams($fields);
        $columns = self::getFieldsString($fields);
        $string = '
    $sqlstr = "INSERT INTO ' . $fields . ' (' . $columns . ') VALUES (' . $values . ')";
    $params = [' . $params . '];
    $registros = self::executeNonQuery($sqlstr, $params);
    return $registros;
';

        return $string;
    }
    private static function generateGet($fields)
    {
        $primaryKey = self::getPrimaryKey($fields);
        $string = ' $sqlstr= "SELECT * FROM ' . $fields . '";
        $params = [];
        $registros = self::obtenerRegistros($sqlstr, $params);
        return $registros;';
        return $string;
    }
    private static function generateUpdate($fields)
    {
        $primaryKey = self::getPrimaryKey($fields);
        $values = self::getFieldsForUpdate($fields);
        $params = self::getParams($fields);
        $string = '
        $sqlstr = "UPDATE ' . $fields . ' SET ' . $values . ' WHERE ' . $primaryKey . ' = :' . $primaryKey . '";
        $params = [' . $params . '];
        $registros = self::executeNonQuery($sqlstr, $params);
        return $registros;
    ';
        return $string;
    }
    private static function generateDelete($fields)
    {
        $primaryKey = self::getPrimaryKey($fields);
        $params = self::getParams($fields);
        $string = '$sqlstr= "DELETE  FROM ' . $fields . ' WHERE ' . $primaryKey . ' = ' . ":" . 'id";
        $params = [' . "'id'" . '=>$id];
        $registros = self::executeNonQuery($sqlstr, $params);
        return $registros;';
        return $string;
    }
    private static function getPrimaryKey($tableName)
    {
        $tableInfo = self::getData($tableName);
        foreach ($tableInfo as $column) {
            if ($column['Key'] === 'PRI') {
                return $column['Field'];
            }
        }
        return null;
    }

    private static function generateObtenerPorId($fields)
    {
        $primaryKey = self::getPrimaryKey($fields);
        $string = ' $sqlstr= "SELECT * FROM ' . $fields . ' WHERE ' . $primaryKey . ' = ' . ":" . 'id";
        $params = [' . "'id'" . '=>$id];
        $registros = self::obtenerUnRegistro($sqlstr, $params);
        return $registros;';
        return $string;
    }
}