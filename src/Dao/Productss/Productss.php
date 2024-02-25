<?php
/**

 * PHP version 8.2.4
 *
 * @Date 22/08/23
 * @Last Update 20/2/24
 * Updated by Skuul2candly
 * Issue Number : 23
 * Ticket Number : 23
 * Changes Approved on 20/2/24
 * Tested by Skullcanldy
 * Description: 
	This is the first documentation commit
 * Disclosure Agreement: 
	Keep this information in secret
 * Last changes done: 
	Documentation Added
	
 * @author     SkullCanldy
 * @link       https://www.php.net/docs.php
 */

namespace Dao\Productss;

use Dao\Table;
/*El siguiente codigo se encarga de hacer las consultas CRUD para la clase del mismo nombre*/

class Productss extends Table
{

        private $productId;
        private $productName;
        private $productDescription;
        private $productPrice;
        private $productImgUrl;
        private $productStock;
        private $productStatus;


        public static function getProducts()
        {
                $sqlstr = "SELECT * FROM products";
                $params = [];
                $registros = self::obtenerRegistros($sqlstr, $params);
                return $registros;
        }

        public static function insertProducts($productId, $productName, $productDescription, $productPrice, $productImgUrl, $productStock, $productStatus)
        {

                $sqlstr = "INSERT INTO products (productId, productName, productDescription, productPrice, productImgUrl, productStock, productStatus) VALUES (:productId , :productName , :productDescription , :productPrice , :productImgUrl , :productStock , :productStatus)";
                $params = ['productId' => $productId, 'productName' => $productName, 'productDescription' => $productDescription, 'productPrice' => $productPrice, 'productImgUrl' => $productImgUrl, 'productStock' => $productStock, 'productStatus' => $productStatus];
                $registros = self::executeNonQuery($sqlstr, $params);
                return $registros;
        }

        public static function updateProducts($productId, $productName, $productDescription, $productPrice, $productImgUrl, $productStock, $productStatus)
        {

                $sqlstr = "UPDATE products SET productId = :productId, productName = :productName, productDescription = :productDescription, productPrice = :productPrice, productImgUrl = :productImgUrl, productStock = :productStock, productStatus = :productStatus WHERE productId = :productId";
                $params = ['productId' => $productId, 'productName' => $productName, 'productDescription' => $productDescription, 'productPrice' => $productPrice, 'productImgUrl' => $productImgUrl, 'productStock' => $productStock, 'productStatus' => $productStatus];
                $registros = self::executeNonQuery($sqlstr, $params);
                return $registros;
        }

        public static function obtenerPorId($id)
        {
                $sqlstr = "SELECT * FROM products WHERE productId = :id";
                $params = ['id' => $id];
                $registros = self::obtenerUnRegistro($sqlstr, $params);
                return $registros;
        }

        public static function deleteProducts($id)
        {
                $sqlstr = "DELETE  FROM products WHERE productId = :id";
                $params = ['id' => $id];
                $registros = self::executeNonQuery($sqlstr, $params);
                return $registros;
        }
        public static function countProducts()
        {
                $sqlstr = "SELECT count(*) FROM products";
                $params = [];
                $registros = self::obtenerUnRegistro($sqlstr, $params);
                return $registros;
        }

        public static function getProductsPaginated($itemsPerPage, $offset)
        {
            $sqlstr = "SELECT * FROM products LIMIT :itemsPerPage OFFSET :offset";
            $params = [
                'itemsPerPage' => $itemsPerPage,
                'OFFSET' => $offset
            ];
        
            $registros = self::obtenerRegistros($sqlstr, $params); 
        
            return $registros;
        }
        
        public static function getProductsBySearch(
                string $partialName = "",
                string $orderBy = "",
                bool $orderDescending = false,
                int $page = 0,
                int $itemsPerPage = 10
        ) {
                $sqlstr = "SELECT * from products p";
                $sqlstrCount = "SELECT COUNT(*) as count FROM products p";
                $conditions = [];
                $params = [];
                if ($partialName != "") {
                        $conditions[] = "(p.productId LIKE :partialName OR p.productName LIKE :partialName)";
                        $params["partialName"] = "%" . $partialName . "%";
                }
                if (count($conditions) > 0) {
                        $sqlstr .= " WHERE " . implode(" AND ", $conditions);
                        $sqlstrCount .= " WHERE " . implode(" AND ", $conditions);
                }
                if (!in_array($orderBy, ["p.productId", "p.productName", "productDescription", ""])) {
                        throw new \Exception("Error Processing Request OrderBy has invalid value");
                }
                if ($orderBy != "") {
                        $sqlstr .= " ORDER BY " . $orderBy;
                        if ($orderDescending) {
                                $sqlstr .= " DESC";
                        }
                }
                $numeroDeRegistros = self::obtenerUnRegistro($sqlstrCount, $params)["count"];
                $pagesCount = ceil($numeroDeRegistros / $itemsPerPage);
                if (
                        $page > $pagesCount - 1
                ) {
                        $page = $pagesCount - 1;
                }
                $sqlstr .= " LIMIT " . $page * $itemsPerPage . ", " . $itemsPerPage;
                $registros = null;
                try {
                        $registros = self::obtenerRegistros($sqlstr, $params);
                } catch (\Exception $e) {
                        $registros = self::getProductsBySearch("", "", false, 0, 10)["productsSearch"];
                }
                return ["productsSearch" => $registros, "total" => $numeroDeRegistros, "page" => $page, "itemsPerPage" => $itemsPerPage];
        }
}
