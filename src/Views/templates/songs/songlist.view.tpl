<div class="flex items-center justify-between mb-4 mx-4">
    <div class="relative w-full flex items-center">
        <input type="text" id="searchbar" name="searchbar" placeholder="Name or ID" class="w-2/3 px-4 py-2 pl-10 pr-8 border border-gray-300 rounded-md">
        <div class="absolute inset-y-0 left-0 flex items-center pl-3">
            <svg class="h-6 w-5 text-gray-400 mb-2" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M21 21l-5.2-5.2m2.8 5.2a9 9 0 11-12.727-12.727 9 9 0 1112.727 12.727z" />
            </svg>
        </div>
        <div class="absolute inset-y-0 right-0 flex items-center pr-3">
            <button id="searchbutton" name="searchbutton" class="px-4 py-2 bg-gray-800 text-white rounded-md hover:bg-gray-700 focus:outline-none focus:bg-gray-700 mr-2">
                Search
            </button>
			<a href="index.php?page=Artists_Artists&mode=INS" class="px-4 py-2 bg-gray-800 text-white rounded-md hover:bg-gray-700 focus:outline-none focus:bg-gray-700">
                Insert
            </a>
        </div>
    </div>
</div>

<section class="grid grid-cols-1 sm:grid-cols-2 md:grid-cols-3 lg:grid-cols-4 gap-4 pb-10 mx-4">
    {{foreach song}}
    <div class="relative bg-gray-900 border border-gray-300 rounded p-4 overflow-hidden flex flex-col justify-between">
        <div class="flex flex-col items-center">
            <img src="{{song_cover}}" alt="{{title_song}}" class="w-full h-48 object-cover mb-2 rounded-lg">
            <h3 class="text-3xl text-pink-500 font-semibold">{{name_artist}}</h3>
            <h3 class="text-2xl text-blue-500 font-semibold ">{{title_album}}</h3>
            <h3 class="text-xl font-bold text-center text-white">{{title_song}}</h3>
        </div>
        <div class="flex flex-col mx-auto justify-around">
            <p class="text-gray-300 mb-2 py-4">Duration: {{duration}}</p>
            <audio class="mr-4 w-40 justify-center" controls>
                <source src="{{link_song}}" type="audio/mpeg">
              </audio>
              
            <div class="mx-auto my-4">
                <a href="index.php?page=Songs_Songs&mode=DSP&id_song={{id_song}}" class="text-blue-500 hover:text-blue-700 mr-2">Details</a>
                <a href="index.php?page=Songs_Songs&mode=UPD&id_song={{id_song}}" class="text-green-500 hover:text-green-700 mr-2">Edit</a>
                <a href="index.php?page=Songs_Songs&mode=DEL&id_song={{id_song}}" class="text-red-500 hover:text-red-700">Delete</a>
            </div>
        </div>
    </div>
    {{endfor song}}
</section>


<script>
    function playPauseAudio(playerId) {
        var audio = document.getElementById(playerId);

        if (audio.paused) {
            audio.play(); 
        } else {
            audio.pause();
        }
    }
</script>
