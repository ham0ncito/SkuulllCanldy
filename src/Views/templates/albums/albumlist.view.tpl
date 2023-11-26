<section class="container mx-auto px-4">
    <h2 class="text-2xl font-bold mb-4">ALBUM</h2>
    <div class="grid grid-cols-3 gap-6">
        <!-- Loop para mostrar cada tarjeta de álbum -->
        {{foreach album}}
        <div class="bg-white rounded-lg overflow-hidden shadow-md relative">
            <img src="{{image_album}}" alt="{{title_album}}" class="w-full h-48 object-cover">
            <div class="p-4">
                <h3 class="text-lg font-semibold mb-2">{{title_album}}</h3>
                <p class="text-gray-600 mb-2">{{release_date_album}}</p>
                <p class="text-gray-700 font-bold">{{number_of_songs_album}} songs</p>
                <div class="mt-4 flex justify-between items-center">
                    <a href="index.php?page=Albums_Albums&mode=DSP&id_album={{id_album}}" class="text-green-500 hover:text-green-700">See more</a>
                    <div x-data="{ isOpen: false }" class="relative inline-block text-left">
                        <div>
                            <button @click="isOpen = !isOpen" type="button" class="inline-flex justify-center w-full rounded-md border border-gray-300 bg-white px-4 py-2 text-sm font-medium text-gray-700 shadow-sm hover:bg-gray-50 focus:outline-none focus:ring-2 focus:ring-indigo-500 focus:ring-offset-2">
                                Options
                                <!-- Heroicon name: solid/chevron-down -->
                                <svg x-bind:class="{ 'transform rotate-180': isOpen, '-mr-1 ml-2 h-5 w-5': !isOpen }" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20" fill="currentColor" aria-hidden="true">
                                    <path fill-rule="evenodd" d="M10 19a1 1 0 01-.707-.293l-8-8a1 1 0 111.414-1.414L10 16.586l7.293-7.293a1 1 0 111.414 1.414l-8 8A1 1 0 0110 19z" clip-rule="evenodd" />
                                </svg>
                            </button>
                        </div>
                        <!-- Dropdown panel, hidden by default unless isOpen is true -->
                        <div x-show="isOpen" @click.away="isOpen = false" id="dropdownMenu{{id_album}}" class="origin-top-right absolute right-0 mt-10 w-48 rounded-md shadow-lg bg-white ring-1 ring-black ring-opacity-5 focus:outline-none z-50" role="menu" aria-orientation="vertical" aria-labelledby="options-menu">
                            <div class="py-1" role="none">
                                <!-- Dropdown links -->
                                <a href="index.php?page=Albums_Albums&mode=UPD&id_album={{id_album}}" class="block px-4 py-2 text-sm text-gray-700 hover:bg-gray-100" role="menuitem">Edit</a>
                                <a href="index.php?page=Albums_Albums&mode=DEL&id_album={{id_album}}" class="block px-4 py-2 text-sm text-red-700 hover:bg-gray-100" role="menuitem">Delete</a>
                            </div>
                        </div>
                    </div>
                                        
                </div>
            </div>
        </div>
      
        {{endfor album}}
    </div>
</section>