{{if ~isADMIN}}
{{ifnot isEmpty}}
<section><h2 class="text-2xl font-bold mb-4"> LISTADO DE USUARIO</h2>
<div class="overflow-x-auto">
<table class="min-w-full bg-white border border-gray-300 mx-6">
<thead class="text-center justify-center mx-2">
<tr>
	<th class="py-2 px-2 text-center justify-center text-white bg-blue-500 border-b">USERCOD</th>
	<th class="py-2 px-2 text-center justify-center text-white bg-blue-500 border-b">USEREMAIL</th>
	<th class="py-2 px-2 text-center justify-center text-white bg-blue-500 border-b">USERNAME</th>
	<th class="py-2 px-2 text-center justify-center text-white bg-blue-500 border-b">USERPSWD</th>
	<th class="py-2 px-2 text-center justify-center text-white bg-blue-500 border-b">USERFCHING</th>
	<th class="py-2 px-2 text-center justify-center text-white bg-blue-500 border-b">USERPSWDEST</th>
	<th class="py-2 px-2 text-center justify-center text-white bg-blue-500 border-b">USERPSWDEXP</th>
	<th class="py-2 px-2 text-center justify-center text-white bg-blue-500 border-b">USEREST</th>
	<th class="py-2 px-2 text-center justify-center text-white bg-blue-500 border-b">USERACTCOD</th>
	<th class="py-2 px-2 text-center justify-center text-white bg-blue-500 border-b">USERPSWDCHG</th>
	<th class="py-2 px-2 text-center justify-center text-white bg-blue-500 border-b">USERTIPO</th><th class="py-2 px-2 text-center justify-center text-white bg-blue-500 border-b"><a href="index.php?page=Usuarios_Usuarios&mode=INS">ADD</a></th>
	</tr>
</thead><tbody>{{foreach usuario}}<tr><td class="p-2 text-center"><a class="text-blue-500 hover:text-blue-700" href="index.php?page=Usuarios_Usuarios&mode=DSP&usercod={{usercod}} ">{{usercod}}</a></td><td class="p-2 text-center"><a class="text-blue-500 hover:text-blue-700" href="index.php?page=Usuarios_Usuarios&mode=DSP&usercod={{usercod}} ">{{useremail}}</a></td><td class="p-2 text-center"><a class="text-blue-500 hover:text-blue-700" href="index.php?page=Usuarios_Usuarios&mode=DSP&usercod={{usercod}} ">{{username}}</a></td><td class="p-2 text-center"><a class="text-blue-500 hover:text-blue-700" href="index.php?page=Usuarios_Usuarios&mode=DSP&usercod={{usercod}} ">{{userpswd}}</a></td><td class="p-2 text-center"><a class="text-blue-500 hover:text-blue-700" href="index.php?page=Usuarios_Usuarios&mode=DSP&usercod={{usercod}} ">{{userfching}}</a></td><td class="p-2 text-center"><a class="text-blue-500 hover:text-blue-700" href="index.php?page=Usuarios_Usuarios&mode=DSP&usercod={{usercod}} ">{{userpswdest}}</a></td><td class="p-2 text-center"><a class="text-blue-500 hover:text-blue-700" href="index.php?page=Usuarios_Usuarios&mode=DSP&usercod={{usercod}} ">{{userpswdexp}}</a></td><td class="p-2 text-center"><a class="text-blue-500 hover:text-blue-700" href="index.php?page=Usuarios_Usuarios&mode=DSP&usercod={{usercod}} ">{{userest}}</a></td><td class="p-2 text-center"><a class="text-blue-500 hover:text-blue-700" href="index.php?page=Usuarios_Usuarios&mode=DSP&usercod={{usercod}} ">{{useractcod}}</a></td><td class="p-2 text-center"><a class="text-blue-500 hover:text-blue-700" href="index.php?page=Usuarios_Usuarios&mode=DSP&usercod={{usercod}} ">{{userpswdchg}}</a></td><td class="p-2 text-center"><a class="text-blue-500 hover:text-blue-700" href="index.php?page=Usuarios_Usuarios&mode=DSP&usercod={{usercod}} ">{{usertipo}}</a></td>
            <td class"p-2 text-center">
                <a class="text-green-500 hover:text-green-700" href="index.php?page=Usuarios_Usuarios&mode=UPD&usercod={{usercod}}" >Edit</a> 
                <a class="text-red-500 hover:text-red-700" href="index.php?page=Usuarios_Usuarios&mode=DEL&usercod={{usercod}}" >Delete</a>
            </td>
	</tr>
 {{endfor usuario}}</tbody>
</table>
</div> </section>{{endifnot isEmpty}}{{if isEmpty}}
{{include components/tarjeta}}{{endif isEmpty}}{{endif ~isADMIN}}