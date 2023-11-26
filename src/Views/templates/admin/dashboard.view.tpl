<div class="container grid grid-cols-5 gap-6 mx-2">
  {{foreach control}}
    <div class="bg-white rounded-lg overflow-hidden shadow-md">
        <img src="{{imgUrl}}" alt="Imagen 1" class="w-full h-48 object-cover">
        <div class="p-4">
            
            <a href="{{url}}" class="text-blue-500 hover:underline"><h3 class="text-lg font-semibold mb-2">{{title}}</h3></a>
        </div>
    </div>
    {{endfor control}}
</div>