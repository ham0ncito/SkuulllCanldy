<div class="flex flex-col items-center mt-8 w-full">
    <div class="relative w-auto md:w-auto mx-4">
        <input type="text" placeholder="Search" class="border-2 w-full border-gray-300 bg-white h-10 px-5 pr-10 rounded-full text-sm focus:outline-none">
        <button type="submit" class="absolute right-0 top-0 mt-3 mr-4">
            <svg class="h-4 w-4 fill-current text-gray-500" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24">
                <path d="M15.5 14h-.79l-.28-.27a6.5 6.5 0 0 0 1.48-5.34c-.47-2.78-2.79-5-5.59-5.34a6.505 6.505 0 0 0-7.27 7.27c.34 2.8 2.56 5.12 5.34 5.59a6.5 6.5 0 0 0 5.34-1.48l.27.28v.79l4.25 4.25c.41.41 1.08.41 1.49 0 .41-.41.41-1.08 0-1.49L15.5 14zm-6 0C7.01 14 5 11.99 5 9.5S7.01 5 9.5 5 14 7.01 14 9.5 11.99 14 9.5 14z"/>
            </svg>
        </button>
    </div>
    <div class=" md:text-left mx-4 my-4">
        <h2 class="text-white text-4xl">Explore</h2>
        <div class="pt-10 pb-10 grid grid-cols-1 sm:grid-cols-2 md:grid-cols-3 lg:grid-cols-4 gap-6">
        {{foreach genre}}
        <div class="max-w-sm rounded-full overflow-hidden shadow-lg relative">
            <a href=""></a>
            <img class="w-full h-40 object-cover" src="{{image_genre}}" alt="Descripción de la imagen">
            <div class="absolute inset-0 flex items-center justify-center opacity-0 hover:opacity-100 transition duration-300 bg-black bg-opacity-50">
              <p class="text-white text-center text-lg">{{name_genre}}</p>
            </div>
          </div>
          
          
        {{endfor genre}}
        </div>
    </div>
</div>
