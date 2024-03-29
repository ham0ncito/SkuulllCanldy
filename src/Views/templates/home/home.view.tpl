<section class="">
    {{if ~isCLN}}
    <section class="flex flex-column w-full h-full justify-center items-center bg-cover bg-center" style="background-image: url('public/videos/ad1.mp4')">
        <div x-data="{ showVideo: false }" class="bg-white shadow-lg rounded-lg p-6 max-w-md w-full text-center bg-opacity-75">
            <h2 class="text-2xl font-bold text-blue-500 text-center">We miss you</h2>
            <p class="text-gray-700">Explore boundless fun with us purchasing a subscription.</p>
            <p class="text-gray-700">Our prices are lower than the green evil company's.</p>
            <button @click="showVideo = true" class="mt-4 bg-blue-500 hover:bg-blue-700 text-white font-bold py-2 px-4 rounded">
                Watch Video
            </button>
            <div x-show="showVideo" class="mt-4" x-transition:enter="transition ease-out duration-300" x-transition:enter-start="opacity-0 transform scale-90" x-transition:enter-end="opacity-100 transform scale-100">
                <video autoplay loop muted class="w-full h-full object-cover">
                    <source src="public/videos/ad1.mp4" type="video/mp4">
                    Your browser does not support the video tag.
                </video>
            </div>
        </div>
    </section>
    <div x-data="{ pulse: true }">
        <a :href="pulse ? 'index.php?page=Store_ShoppingCart' : 'index.php?page=Store_Store'" x-on:mouseover="pulse = false" x-on:mouseleave="pulse = true" :class="{ 'animate-pulse': pulse }" class="relative inline-block bottom-4 left-4 bg-white p-2 rounded-full shadow-lg">
            <svg xmlns="http://www.w3.org/2000/svg" class="h-6 w-6 text-gray-700" viewBox="0 0 20 20" fill="currentColor">
                <path fill-rule="evenodd" d="M16.293 5.293l-1.482-1.482A1 1 0 0 0 13.5 4H6.5a1 1 0 0 0-.809.418L4.207 5.293a1 1 0 0 0 0 1.414l.082.082 2 2a1 1 0 0 0 1.32.083l.094-.083L9.5 7.414V14a2 2 0 0 0 2 2h1a2 2 0 0 0 2-2V7.414l.295.295a1 1 0 0 0 1.32.083l.094-.083 2-2a1 1 0 0 0 0-1.414zM7 16a1 1 0 1 1 0-2 1 1 0 0 1 0 2zm6-2a1 1 0 1 1-2 0 1 1 0 0 1 2 0z"/>
            </svg>
            <span class="absolute bottom-0 left-0 w-full h-1 bg-blue-500 rounded-b-full"></span>
        </a>
    </div>
    
    {{endif ~isCLN}}
</section>

<section class="container">
    
    {{if ~isCLS}}
    <div>
      
        <div class="container mx-auto flex flex-wrap justify-evenly items-center align-center pb-4">
           
            <a href="#" class="text-white p-6 mx-auto my-auto items-center text-center text-3xl font-bold"><span class="text-4xl  my-auto mr-4 text-animation">Explore</span></a>
            <div x-data="{ open: false }" class="md:hidden mx-auto">
                <button @click="open = !open" class="text-white mx-auto focus:outline-none">
                    <svg class="h-6 w-6" viewBox="0 0 20 20" fill="currentColor">
                        <path x-show="!open" fill-rule="evenodd" clip-rule="evenodd" d="M3 4h14a1 1 0 0 1 0 2H3a1 1 0 0 1 0-2zm0 5h14a1 1 0 0 1 0 2H3a1 1 0 0 1 0-2zm0 5h14a1 1 0 0 1 0 2H3a1 1 0 0 1 0-2z"/>
                        <path x-show="open" fill-rule="evenodd" clip-rule="evenodd" d="M14.293 5.293a1 1 0 0 1 1.414 1.414L11 12.414l-4.707-4.707a1 1 0 1 1 1.414-1.414L11 9.586l3.293-3.293a1 1 0 0 1 1.414 0z"/>
                    </svg>
                </button>
                <div x-show="open" @click.away="open = false" class="absolute top-16 right-0 z-10 bg-gray-800 rounded-lg shadow-lg mt-2 py-2 w-48 mx-auto">
                  {{foreach genre}}
                    <a href="index.php?page=Genres_Genres&mode=DSP&id_genre={{id_genre}}" class="block px-4 py-2 text-white hover:bg-pink-500">{{name_genre}}</a>
                {{endfor genre}}
                </div>
            </div>
       
            <div class="hidden md:flex md:flex-wrap justify-around items-center md:grid-cols-4 align-center space-x-4 space-y-auto mx-auto">
                {{foreach genre}}
                <a href="index.php?page=Genres_Genres&mode=DSP&id_genre={{id_genre}}" class="block px-4 py-2 text-white hover:bg-blue-500 bg-gray-600 rounded-full my-2 mx-auto">{{name_genre}}</a>
            {{endfor genre}}
            </div>
        </div>
    </div>
    <h2 class="mx-6 text-3xl font-bold mb-4"><span class="text-green-500 text-5xl mr-2">Artists</span> Vibing Like You</h2>

    <div class="py-4 mx-6 grid grid-cols-1 sm:grid-cols-2 md:grid-cols-2 gap-8">
        {{foreach artist}}
        <div class="relative max-w-md mx-auto bg-white rounded-xl shadow-lg overflow-hidden transform hover:scale-105 transition duration-300">
            <div>
                <img class="h-60 w-full object-cover md:h-64 md:w-full" src="{{image_artist}}" alt="Imagen">
            </div>
            <div class="p-6 md:p-8">
                <h2 class="uppercase tracking-wide text-2xl text-indigo-500 font-semibold">{{name_artist}}</h2>
                <p class="block pb-6 mt-1 text-sm leading-tight font-medium text-black">{{artist_bio}}</p>
                {{if ~isADMIN}}
                <div class="absolute pt-4 pb-2 bottom-0 left-0 right-0 text-center">
                    <a href="index.php?page=Artists_Artists&mode=DSP&id_artist={{id_artist}}" class="text-indigo-600 hover:text-indigo-900 font-semibold transition duration-300">See more</a>
                </div>
                {{endif ~isADMIN}}
            </div>
        </div>
        {{endfor artist}}
    </div>
    

    <h2 class="text-3xl font-bold mx-6 my-4"><span class="text-5xl text-blue-500 mr-2">Videos</span> You Are Going To Love</h2>
    <div class="grid grid-cols-1 md:grid-cols-2 items-center align-center gap-4 ">
        {{foreach videos}}
        <div class="relative max-w-md bg-white rounded-xl shadow-lg overflow-hidden transform hover:scale-105 transition duration-300">
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
    <div class=" mx-6 grid grid-cols-1 md:grid-cols-2 gap-6">
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
    {{endif ~isCLS}}
</section>
{{if ~isADMIN}}
<div x-data="{ isAdmin: true }" x-show="isAdmin" class="bg-green-100 border border-green-400 text-green-700 px-4 py-3 rounded relative" role="alert">
    <strong class="font-bold p-4">Welcome back Manager!</strong>
    <span class="block sm:inline">You've been granted with unique settings</span>
    <span class="absolute top-0 bottom-0 mx-auto px-4 py-3 bg-green-100">
        <svg x-on:click="isAdmin = false" class="fill-current h-6 w-6 text-green-500" role="button" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20"><title>Close</title><path d="M14.348 14.849c-.469.469-1.229.469-1.697 0L10 11.819l-2.651 3.029c-.469.469-1.229.469-1.697 0-.469-.469-.469-1.229 0-1.697L8.303 10 5.652 6.971c-.469-.469-.469-1.229 0-1.697.469-.469 1.229-.469 1.697 0L10 8.181l2.651-3.029c.469-.469 1.229-.469 1.697 0 .469.469.469 1.229 0 1.697L11.697 10l2.651 3.029c.469.469.469 1.229 0 1.697z"/></svg>
    </span>
</div>
<div class="w-64 my-6 mx-auto">
    <img src="public/imgs/logo/logoSkuul.png" alt="Imagen" class="bg-white my-auto w-full h-auto rounded-full shadow-md transform hover:scale-105 transition duration-300">
  </div>
  
{{endif ~isADMIN}}
{{if ~isAUDIT}}
<div x-data="{ isAdmin: true }" x-show="isAdmin" class="bg-green-100 border border-green-400 text-green-700 px-4 py-3 rounded relative" role="alert">
    <strong class="font-bold p-4">Welcome back Auditor!</strong>
    <span class="block sm:inline">We look forward to make easier your auditory with this dashboard</span>
    <span class="absolute top-0 bottom-0 mx-auto px-4 py-3 bg-green-100">
        <svg x-on:click="isAdmin = false" class="fill-current h-6 w-6 text-green-500" role="button" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20"><title>Close</title><path d="M14.348 14.849c-.469.469-1.229.469-1.697 0L10 11.819l-2.651 3.029c-.469.469-1.229.469-1.697 0-.469-.469-.469-1.229 0-1.697L8.303 10 5.652 6.971c-.469-.469-.469-1.229 0-1.697.469-.469 1.229-.469 1.697 0L10 8.181l2.651-3.029c.469-.469 1.229-.469 1.697 0 .469.469.469 1.229 0 1.697L11.697 10l2.651 3.029c.469.469.469 1.229 0 1.697z"/></svg>
    </span>
</div>
<div class="w-64 my-6 mx-auto">
    <img src="public/imgs/logo/logoSkuul.png" alt="Imagen" class="bg-white my-auto w-full h-auto rounded-full shadow-md transform hover:scale-105 transition duration-300">
  </div>
  

{{endif ~isAUDIT}}
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