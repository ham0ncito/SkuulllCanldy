{{if isADMIN}}
<div class="flex justify-center items-center text-black py-20 mx-4">
    <div class="max-w-md bg-gray-600 p-6 rounded-md items-center shadow-md">
        <h1 class="text-2xl text-green-400 font-bold mb-4">Enter the name of the SQL table</h1>
        <form action="index.php?page=Escupitajo_GenerarCrud" method="POST">
            <div class="mb-4">
                <label for="nombre_tabla" class="block text-white text-sm font-bold mb-2">Table Name:</label>
                <input type="text" id="nombre_tabla" name="nombre_tabla" required
                    class="w-full text-black p-2 bg-gray-700 rounded-md focus:outline-none focus:border-green-500">
            </div>
            <div class="mt-6">
                <button type="submit" name="escupitajobutton" value="Enviar"
                    class="bg-pink-500 hover:bg-pink-700 text-white font-bold py-2 px-4 rounded
                           focus:outline-none focus:shadow-outline">
                    Spit
                </button>
            </div>
        </form>
    </div>
</div>
{{if isADMIN}}
