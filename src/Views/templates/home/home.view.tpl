<section class="">
    {{if ~isCLN}}
        <section class="flex flex-column w-full h-full justify-center items-center bg-cover bg-center">
            <div class="bg-white shadow-lg rounded-lg p-6 max-w-md w-full text-center">
                <h2 class="text-2xl font-bold text-white text-center mb-6">We miss you</h1>
                <p class="text-gray-700">Explore boundless fun with us purchasing a subscription.</p>
                <p class="text-gray-700">Our prices are lower than the green evil company's.</p>
            </div>
        </section>
    {{endif ~isCLN}}
</section>

<section class="container mx-4">
    
    {{ifnot ~isCLN}}
    <div class="mx-6 mt-0 mb-4">
      
        <div class="container mx-auto flex justify-between items-center align-center">
           
            <a href="#" class="text-white text-2xl font-bold"><span class="text-3xl mr-4 text-animation">Explore</span> your genre</a>
            <div x-data="{ open: false }" class="md:hidden">
                <button @click="open = !open" class="text-white focus:outline-none">
                    <svg class="h-6 w-6" viewBox="0 0 20 20" fill="currentColor">
                        <path x-show="!open" fill-rule="evenodd" clip-rule="evenodd" d="M3 4h14a1 1 0 0 1 0 2H3a1 1 0 0 1 0-2zm0 5h14a1 1 0 0 1 0 2H3a1 1 0 0 1 0-2zm0 5h14a1 1 0 0 1 0 2H3a1 1 0 0 1 0-2z"/>
                        <path x-show="open" fill-rule="evenodd" clip-rule="evenodd" d="M14.293 5.293a1 1 0 0 1 1.414 1.414L11 12.414l-4.707-4.707a1 1 0 1 1 1.414-1.414L11 9.586l3.293-3.293a1 1 0 0 1 1.414 0z"/>
                    </svg>
                </button>
                
                <div x-show="open" @click.away="open = false" class="absolute top-16 right-0 z-10 bg-gray-800 rounded-lg shadow-lg mt-2 py-2 w-48">
                  {{foreach genre}}
                    <a href="index.php?page=Genres_Genres&mode=DSP&id_genre={{id_genre}}" class="block px-4 py-2 text-white hover:bg-pink-500">{{name_genre}}</a>
                {{endfor genre}}
                </div>
            </div>
       
            <div class="hidden md:flex space-x-4">
                {{foreach genre}}
                <a href="index.php?page=Genres_Genres&mode=DSP&id_genre={{id_genre}}" class="block px-4 py-2 text-white hover:bg-blue-500">{{name_genre}}</a>
            {{endfor genre}}
            </div>
        </div>
    </div>
    <h2 class="mx-6 text-3xl font-bold mb-4"><span class="text-green-500 text-5xl mr-2">Artists</span> Vibing Like You</h2>

    <div class="py-4 mx-6 grid grid-cols-1 md:grid-cols-4 gap-8">
        {{foreach artist}}
        <div class=" relative max-w-md mx-auto bg-white rounded-xl shadow-lg overflow-hidden">
            <div>
                <img class="h-60 w-full object-cover md:h-64 md:w-full" src="{{image_artist}}" alt="Imagen">
            </div>
            <div class="p-6 md:p-8">
                <h2 class="uppercase tracking-wide text-2xl text-indigo-500 font-semibold">{{name_artist}}</h2>
                <p class="block pb-6 mt-1 text-sm leading-tight font-medium text-black">{{artist_bio}}</p>
               {{if ~isADMIN}}
                <div class="absolute pt-4 pb-2 bottom-0 left-0 right-0 text-center">
                    <a href="index.php?page=Artists_Artists&mode=DSP&id_artist={{id_artist}}" class="text-indigo-600 hover:text-indigo-900 font-semibold">See more</a>
                </div>
                {{endif ~isADMIN}}
            </div>
        </div>
        {{endfor artist}}
    </div>

    <h2 class="text-3xl font-bold mx-6 my-4"><span class="text-5xl text-blue-500 mr-2">Videos</span> You Are Going To Love</h2>
    <div class="grid grid-cols-1 md:grid-cols-3 gap-6">
        {{foreach videos}}
        <div class="relative max-w-md mx-6 bg-white rounded-xl shadow-lg overflow-hidden">
            <div>
                <video class="h-48 w-full object-fit md:h-80 md:w-full" controls>
                    <source src="{{link_video}}" type="video/mp4">
                    You aren't allowed to watch this video
                </video>
            </div>
            <div class="p-6 md:p-8">
                <h2 class="uppercase tracking-wide text-2xl text-indigo-500 font-semibold">{{name_artist}}</h2>
                <h3 class="block pb-2 mt-1 text-lg leading-tight font-medium text-black">{{title_video}}</h3>
                <p class="text-gray-600">{{description_video}}</p>
                {{if ~isADMIN}}
                <div class="absolute pt-4 pb-2 bottom-0 left-0 right-0 text-center">
                    <a href="index.php?page=Videos_Videos&mode=DSP&id_video={{id_video}}"" class="text-indigo-600 hover:text-indigo-900 font-semibold">See more</a>
                </div>
                {{endif ~isADMIN}}
            </div>
        </div>
        
        {{endfor videos}}
    </div>
    <h2 class="text-3xl font-bold mx-6 my-4"><span class="text-5xl text-blue-500 mr-2">Check out</span> some albums</h2>
    <div class=" mx-6 grid grid-cols-1 md:grid-cols-4 gap-6">
        {{foreach albums}}
        <div class="max-w-xs rounded overflow-hidden shadow-2xl">
            <div class="relative">
              <img class="w-80 h-80" src="{{image_album}}" alt="{{title_album}}">
              <div class="absolute top-0 left-0 w-full h-full flex items-center justify-center opacity-0 hover:opacity-100 transition-opacity duration-300 bg-black bg-opacity-50 text-white text-center">
                <span class="font-bold text-lg">{{title_album}}</span>
              </div>
            </div>
          </div>          
          {{endfor albums}}      
    </div>
    {{endifnot ~isCLN}}
</section>
<style>
    .text-animation {
        color: #ffffff;
        animation: colorChange 3s infinite alternate;
      }
      
      @keyframes colorChange {
        0% {
          color: #ff99cc; 
        }
        33% {
          color: #cc66cc; 
        }
        66% {
          color: #6699cc;
        }
        100% {
          color: #ff99cc;
        }
      }
      
</style>