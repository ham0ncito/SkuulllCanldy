<section class="flex flex-wrap justify-start">
    {{foreach song}}
    <div class="w-full md:w-1/2 lg:w-1/3 xl:w-1/4 p-4">
        <div class="bg-white rounded-md shadow-md">
            <h3 class="text-lg font-semibold p-4">{{title_song}}</h3>
            <div class="relative">
                <img src="{{song_cover}}" alt="{{title_song}}" class="w-full h-48 object-cover">
                <div x-data="{ isPlaying: false, audio: null }" class="absolute inset-0 flex items-center justify-center">
                    <audio x-ref="audio" x-bind:src="link_song" preload="metadata"></audio>
                    <button @click="isPlaying = !isPlaying; var audio = $refs.audio; if (isPlaying) { audio.play(); } else { audio.pause(); }" class="px-4 py-2 bg-gray-800 text-white rounded-md hover:bg-gray-700 focus:outline-none">
                        {{isPlaying ? 'Pause' : 'Play'}}
                    </button>
                </div>
            </div>
            <div class="p-4">
                <p class="text-gray-600 mb-2">Duration: {{duration}}</p>
                <p>ID Song: {{id_song}}</p>
                <p>ID Genre: {{id_genre}}</p>
                <p>Album ID: {{album_id}}</p>
                <p>Status: {{status_song}}</p>
                <div class="mt-2">
                    
                    <a href="{{link_song}}" @click="var audio = $refs.audio; audio.paused ? audio.play() : audio.pause();" class="text-blue-500 hover:text-blue-700 mr-2">Play/Pause</a>
                    <a href="index.php?page=Songs_Songs&mode=DSP&id_song={{id_song}}" class="text-blue-500 hover:text-blue-700 mr-2">Details</a>
                    <a href="index.php?page=Songs_Songs&mode=UPD&id_song={{id_song}}" class="text-green-500 hover:text-green-700 mr-2">Edit</a>
                    <a href="index.php?page=Songs_Songs&mode=DEL&id_song={{id_song}}" class="text-red-500 hover:text-red-700">Delete</a>
                </div>
            </div>
        </div>
    </div>
    {{endfor song}}
</section>
<script>
    function playPauseAudio(playerId) {
        var audio = document.getElementById(playerId);

        if (audio.paused) {
            audio.play(); // Reproduce la canción si está pausada
        } else {
            audio.pause(); // Pausa la canción si está reproduciéndose
        }
    }
</script>
