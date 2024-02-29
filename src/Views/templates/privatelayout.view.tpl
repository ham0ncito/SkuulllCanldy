<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>{{SITE_TITLE}}</title>
  <link rel="stylesheet" href="/{{BASE_DIR}}/node_modules/@splidejs/splide/dist/css/splide.min.css">
<link rel="stylesheet" href="/{{BASE_DIR}}/node_modules/normalize.css/normalize.css">

  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css">
  <link rel="icon" href="/{{BASE_DIR}}/public/imgs/favicon/favicon.ico" type="image/x-icon">
  <link href="https://fonts.googleapis.com/css2?family=Montserrat&display=swap" rel="stylesheet">
  
  <link rel="shortcut icon" href="/{{BASE_DIR}}/public/imgs/favicon/favicon.ico" type="image/x-icon">
  <script src="https://kit.fontawesome.com/{{FONT_AWESOME_KIT}}.js" crossorigin="anonymous"></script>
     <script defer src="https://cdn.jsdelivr.net/npm/alpinejs@3.x.x/dist/cdn.min.js"></script>
  <script src="anime.min.js"></script>
  <script src="https://code.jquery.com/jquery-3.6.0.min.js" defer></script>

  <script defer>
    let MelodyElements;
    let once = false;
    function updatePlayerInterface(audio){
      let playerInfo = document.getElementById("playerInfo");
      let songTitle = document.getElementById("songTitle");
      let artistName = document.getElementById("artistName");
      let songCover = document.getElementById("songCover");
      let durationText = document.getElementById("trackDuration");
      let durationInMinutes = audio.getAttribute("data-duration");
      let currentTime = audio.currentTime;
      
      
      songTitle.innerHTML = audio.getAttribute("data-title");
      artistName.innerHTML = audio.getAttribute("data-artist");
      songCover.src = audio.getAttribute("data-cover");
      durationText.innerHTML =  durationInMinutes;
      let seekBar = document.getElementById("seekBar");
      seekBar.max = parseFloat(durationInMinutes) * 60;
      console.log("SkBar max",seekBar.max);
      
    }
    
    
    function loadingPagewithAudio(link) {
      console.log("works until here 0");
      let songElements = document.querySelectorAll("audio");
      let linkSplit = link.split('/').pop();
      let elementId;
      let audio;
      let empty = true;
      console.log("works until here 1");
      for(let i = 0; i<songElements.length; i++){
        audio = songElements[i];
        if(!audio.paused){
          elementId = `playerId${i}`;
          empty = false;
          break;
        }
      }
      songElements = null;
      console.log("works until here 2");
      if (empty == true){
        $.get('http://localhost/Nweb/SkullC/SkuulllCanldy/'  + linkSplit, function(data) {
          $('#main-content').html($(data).find('#main-content'));
          console.log("hello");
          console.log("works until here 3");
        });
      } else {
        audio = document.getElementById(elementId);
        let source = audio.querySelector("source");
        console.log(source);
        localStorage.setItem("audioSource",source.src);
        console.log(source);
        localStorage.setItem("audioTime", audio.currentTime);
        console.log(audio.currentTime);
        console.log("anchor clicked function");
        let currentPage = window.location.href.split('/').pop();
        console.log("works until here 4");
        $.get('http://localhost/Nweb/SkullC/SkuulllCanldy/'  + linkSplit, function(data) {
            $('#main-content').html($(data).find('#main-content'));
            var newAudio = document.createElement("audio"); 
            newAudio.id = "playerId0"; 
            newAudio.className = "mr-4 w-40 justify-center";
            newAudio.controls = true; 
            var newSource = document.createElement("source"); 
            newSource.src = localStorage.getItem("audioSource"); 
            newSource.type = "audio/mpeg"; 
            newAudio.appendChild(newSource); 
            newAudio.setAttribute("data-artist",audio.getAttribute("data-artist"));
            newAudio.setAttribute("data-title",audio.getAttribute("data-title") );
            newAudio.setAttribute("data-cover", audio.getAttribute("data-cover"));
            newAudio.setAttribute("data-duration",audio.getAttribute("data-duration") );    
            $('#main-content').append(newAudio); 
            newAudio.currentTime = localStorage.getItem("audioTime"); 
            newAudio.style.display = "none";
            audio.removeAttribute("data-state");
            newAudio.play();
            newAudio.setAttribute("data-state","playing" );
            updatePlayerInterface(newAudio);
            console.log("works until here 5");
            console.log(linkSplit);
        }); 
        
      }
      
    }
    function anchorClick(event, element){
        event.preventDefault();
        window.history.pushState(null, null, element.getAttribute('href'));
        loadingPagewithAudio(element.getAttribute('href'));
    }
    window.addEventListener('popstate', function(e) {
      loadingPagewithAudio(location.pathname);     
    });
</script>
  {{foreach SiteLinks}}
    <link rel="stylesheet" href="/{{~BASE_DIR}}/{{this}}" />
  {{endfor SiteLinks}}
  {{foreach BeginScripts}}
    <script src="/{{~BASE_DIR}}/{{this}}"></script>
  {{endfor BeginScripts}}
</head>
<body class="bg-gradient-to-r from-gray-900 to-indigo-900 bg-cover font-sans flex items-center justify-center h-screen">
  <main class="mx-auto items-center justify-around">
    <section class="w-full h-screen md:w-2/3  justify-around">
      <header class=" text-white py-4 mt-4 mx-auto flex items-center justify-between">
        <nav id="menu" class="flex flex-wrap py-4 mx-auto justify-around space-x-4 flex-col">
          {{with login}}
          
          {{endwith login}}
          <ul class="flex flex-wrap justify-around mx-6 items-center space-y-6 space-x-2">
            <div x-data="{ showModal: false }" class="relative">
              <button @click="showModal = true" class="bg-pink-500 hover:bg-pink-700 text-white font-bold p-2 mt-4 mx-auto rounded-full">
                <svg width="30px" height="30px" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg"><g id="SVGRepo_bgCarrier" stroke-width="0"></g><g id="SVGRepo_tracerCarrier" stroke-linecap="round" stroke-linejoin="round"></g><g id="SVGRepo_iconCarrier"> <circle cx="12" cy="6" r="4" stroke="#ffffff" stroke-width="1.5"></circle> <path d="M19.9975 18C20 17.8358 20 17.669 20 17.5C20 15.0147 16.4183 13 12 13C7.58172 13 4 15.0147 4 17.5C4 19.9853 4 22 12 22C14.231 22 15.8398 21.8433 17 21.5634" stroke="#ffffff" stroke-width="1.5" stroke-linecap="round"></path> </g></svg>
              </button>
              <div x-show="showModal" class="fixed z-10 inset-0 overflow-y-auto">
                <div class="flex items-center justify-center min-h-screen pt-4 px-4 pb-20 text-center sm:block sm:p-0">
                  <div x-show="showModal" class="fixed inset-0 transition-opacity" x-transition:enter="ease-out duration-300" x-transition:enter-start="opacity-0" x-transition:enter-end="opacity-100" x-transition:leave="ease-in duration-200" x-transition:leave-start="opacity-100" x-transition:leave-end="opacity-0">
                    <div class="absolute inset-0 bg-black opacity-75"></div>
                  </div>
                  <span class="hidden sm:inline-block sm:align-middle sm:h-screen" aria-hidden="true">&#8203;</span>
                  <div x-show="showModal" class="inline-block align-bottom bg-white rounded-lg text-left overflow-hidden shadow-xl transform transition-all sm:my-8 sm:align-middle sm:max-w-lg sm:w-full">
                    <div class="bg-white px-4 pt-5 pb-4 sm:p-6 sm:pb-4">
                      <p class="text-lg text-center font-medium leading-6 text-gray-900 whitespace-normal sm:whitespace-nowrap" id="modal-title">Do you want to continue?</h3>
                           
      
                    </div>
                    
                    <div class="bg-gray-50 px-4 py-3 sm:px-6 sm:flex sm:flex-row-reverse">
                      <button @click="showModal = false" type="button" class="text-xl text-blue-500 mx-2 hover:text-gray-300">Close</button>
                      <a href="index.php?page=sec_logout" class="text-xl mx-2 text-red-500 hover:text-gray-300">Logout</a>
                    </div>
                  </div>
                </div>
              </div>
            </div>
            <li><a href="index.php?page=Home_Home"  class="bg-gray-500 hover:bg-purple-700 p-2 font-bold rounded-full" {{if ~isCLS}} onclick="anchorClick(event,this)" {{endif ~isCLS}}>Home</a></li>
            {{if ~isCLS}}
            <li><a href="index.php?page=Search_Search" class="bg-gray-500 hover:bg-purple-700 p-2 font-bold rounded-full" onclick="anchorClick(event,this)">Discover</a></li>
            <li><a href="index.php?page=Playlists_Playlist" class="bg-gray-500 hover:bg-purple-700 p-2 font-bold rounded-full" onclick="anchorClick(event,this)">Playlists</a></li>
            <li><a href="index.php?page=Songs_Song" class="bg-gray-500 hover:bg-purple-700 p-2 font-bold rounded-full" onclick="anchorClick(event,this)">Music</a></li>
            <li><a href="index.php?page=Videos_Video" class="bg-gray-500 hover:bg-purple-700 p-2 font-bold rounded-full" onclick="anchorClick(event,this)">Videos</a></li>
            <li><a href="index.php?page=Artists_Artist" class="bg-gray-500 hover:bg-purple-700 p-2 font-bold rounded-full" onclick="anchorClick(event,this)">Artists</a></li>
            <li><a href="index.php?page=Albums_Album" class="bg-gray-500 hover:bg-purple-700 p-2 font-bold rounded-full" onclick="anchorClick(event,this)">Albums</a></li>
            <li><a href="index.php?page=Store_Store" class="bg-gray-500 hover:bg-purple-700 p-2 font-bold rounded-full" onclick="anchorClick(event,this)">Store</a></li>
            <li><a href="index.php?page=Store_ShoppingCart" class="bg-gray-500 hover:bg-purple-700 p-2 font-bold rounded-full" onclick="anchorClick(event,this)">Cart</a></li>
            <li><a href="index.php?page=Purchases_Purchase" class="bg-gray-500 hover:bg-purple-700 p-2 font-bold rounded-full"onclick="anchorClick(event,this)">Purchases</a></li>
            
            {{endif ~isCLS}}
            {{if ~isCLN}}
            <li><a href="index.php?page=Store_Store" class="bg-gray-500 hover:bg-purple-700 p-2 font-bold rounded-full" {{if ~isCLS}} onclick="anchorClick(event,this)" {{endif ~isCLS}}>Store</a></li>
            <li><a href="index.php?page=Store_ShoppingCart" class="bg-gray-500 hover:bg-purple-700 p-2 font-bold rounded-full" {{if ~isCLS}} onclick="anchorClick(event,this)" {{endif ~isCLS}}>Cart</a></li>
            <li><a href="index.php?page=Purchases_Purchase" class="bg-gray-500 hover:bg-purple-700 p-2 font-bold rounded-full" {{if ~isCLS}} onclick="anchorClick(event,this)" {{endif ~isCLS}}>Purchases</a></li>
            {{endif ~isCLN}}
            {{if ~isADMIN}}
            <li><a href="index.php?page=Admin_Dashboard" class="bg-gray-500 hover:bg-purple-700 p-2 font-bold rounded-full">Dashboard</a></li>
            <li><a href="index.php?page=Escupitajo_GenerarCrud" class="bg-gray-500 hover:bg-purple-700 p-2 font-bold rounded-full">Create Controllers</a></li>
           
            {{endif ~isADMIN}}
            {{if ~isAUDIT}}
            <li><a href="index.php?page=Audit_Audit" class="bg-gray-500 hover:bg-purple-700 p-2 font-bold rounded-full">Audit</a></li>
            {{endif ~isAUDIT}}
        </ul>
         <div class="rounded-lg ml-0 text-white pt-4 pl-0 px-8 flex items-center justify-center my-6" id="playerInfo">
          <div class="w-20 mx-2 rounded-lg">
            
            <img class="rounded-lg" id="songCover" src="https://images.pexels.com/photos/14808405/pexels-photo-14808405.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1" alt="Album Cover">
          </div>
          <div class="track-info pr-4 w-3/12">
              <h2 class="text-lg " id="songTitle">Play Music</h2>
              <p class="text-sm" id="artistName">Choose a song</p>
          </div>
        <div class="flex items-center flex-col pl-4">
          <div class="controls">
            <button id="playButton" style="display:none" onclick="playPause()" ><svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="#fff" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><polygon points="5 3 19 12 5 21 5 3"></polygon></svg></button>
            <button id="pauseButton" style="display:none" onclick="playPause()"><svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="#fff" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><rect x="6" y="4" width="4" height="16"></rect><rect x="14" y="4" width="4" height="16"></rect></svg></button>
        </div>
        <div class="flex flex-row justify-between px-4">
            <div class="current-time pr-1">0:00</div>
            <input type="range" class="seek-bar" id="seekBar" value="0" min="0" max="100">
            <div class="track-duration pl-1" id="trackDuration">3:30</div> 
        </div>
        </div>
        </div>
        
        </nav>
      </header>
      
      <div class="container align-center justify-center">
        <div class="mt-16 mx-auto pb-16 text-blue-500" id="main-content">
          {{{page_content}}}
          <script>
            document.querySelectorAll("audio").forEach(function(audio) {
              audio.addEventListener('play', function(e) {
                console.log('Play event triggered');
                let audioPlayingBefore = document.querySelector("[data-state=playing]");
                if (audioPlayingBefore){
                  audioPlayingBefore.pause();
                  audioPlayingBefore.removeAttribute("data-state");
                }
                console.log("debugging");
                let audioElements = document.querySelectorAll("audio");
                let elementId;
                for (let i = 0; i < audioElements.length; i++) {
                    let currentAudio = audioElements[i];
                    if (!currentAudio.paused) {
                        elementId = `playerId${i}`;
                        break;
                    }
                }
                if (!once){
                  console.log("script execution check");
                  let playButton = document.getElementById("playButton");
                  let pauseButton = document.getElementById("pauseButton");
                  playButton.style.display = 'none';
                  pauseButton.style.display = 'block';
                  once = true;
                }
                console.log(elementId);
                let playingAudio = document.getElementById(elementId);
                playingAudio.setAttribute("data-state","playing");
                updatePlayerInterface(playingAudio);
              });
              audio.addEventListener('timeupdate', function() {
                    console.log("Check Event listenre");
                    let currentTime = audio.currentTime;
                    let duration = audio.duration;
                    let seekBar = document.getElementById("seekBar");
                    seekBar.value = currentTime ;
                    
              });
            });
            function playPause(){
              let currentAudio = document.querySelector("[data-state]");
              let playButton = document.getElementById("playButton");
              let pauseButton = document.getElementById("pauseButton");
              if(currentAudio.getAttribute("data-state") === "paused"){
                playButton.style.display = 'none';
                pauseButton.style.display='block';
                currentAudio.play();
                console.log("play");
              } else if(currentAudio.getAttribute("data-state") === "playing"){
                playButton.style.display = 'block';
                pauseButton.style.display='none';
                currentAudio.setAttribute("data-state","paused");
                currentAudio.pause();
                console.log("pause");
              }
            }
          </script>
        </div>
      </div>
     
    </section>
        
   
  </main>
  <button onclick="scrollToTop()" class="fixed bottom-8 right-8 bg-blue-500 text-white p-2 rounded-full shadow-md hover:bg-blue-600 focus:outline-none transition-colors duration-300">
    <svg xmlns="http://www.w3.org/2000/svg" class="h-6 w-6 inline-block m-auto" fill="none" viewBox="0 0 24 24" stroke="currentColor">
      <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M5 10l7-7m0 0l7 7m-7-7v18"></path>
    </svg>
  </button>
  
</body>


  {{foreach EndScripts}}
  <script src="/{{~BASE_DIR}}/{{this}}"></script>
  {{endfor EndScripts}}
  <script>
    import Highway from '@dogstudio/highway/src/highway';
  </script>
  
  <script>
    const menuList = document.getElementById('menuList');
    const menuButton = document.getElementById('menuButton');
    
    menuButton.addEventListener('click', () => {
        menuList.classList.toggle('hidden');
    });
  </script>

  <script>
    function scrollToTop() {
      window.scrollTo({
        top: 0,
        behavior: 'smooth'
      });
    }
    
  </scrip>
</body>
</html>