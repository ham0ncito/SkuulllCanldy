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
  {{foreach SiteLinks}}
    <link rel="stylesheet" href="/{{~BASE_DIR}}/{{this}}" />
  {{endfor SiteLinks}}
  {{foreach BeginScripts}}
    <script src="/{{~BASE_DIR}}/{{this}}"></script>
  {{endfor BeginScripts}}
</head>
<body class="bg-gradient-to-r from-gray-900 to-indigo-900 bg-cover font-sans flex items-center justify-center h-screen">
  <main class="flex flex-wrap items-center justify-around">
    <section class="w-full h-screen md:w-2/3 mx-4 justify-around">
      <header class="mb-4 text-white py-4 my-4 flex items-center justify-between">
        <nav id="menu" class="flex py-4 mx-auto justify-around space-x-4">
          {{with login}}
          <div x-data="{ showModal: false }" class="relative">
            <button @click="showModal = true" class="bg-pink-500 hover:bg-pink-700 text-white font-bold py-2 px-4 rounded-full">
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
                    <div class="sm:flex sm:items-start">
                      <img class="mx-auto h-24 w-24 rounded-full" src="https://th.bing.com/th/id/OIP.Gfp0lwE6h7139625a-r3aAHaHa?rs=1&pid=ImgDetMain" alt="Profile photo">
                      <div class="mt-3 text-center sm:mt-0 sm:ml-4 sm:text-left">
                        <h3 class="text-lg font-medium leading-6 text-gray-900" id="modal-title">Your profile</h3>
                        <div class="mt-2">
                          <p class="text-sm text-gray-500 pt-2">Username: <span class="font-bold">{{userName}}</span></p>
                         
                          
                        </div>
                      </div>
                    </div>
                  </div>
                  
                  <div class="bg-gray-50 px-4 py-3 sm:px-6 sm:flex sm:flex-row-reverse">
                    <button @click="showModal = false" type="button" class="text-xl text-blue-500 mx-2 hover:text-gray-300">Close</button>
                    <a href="index.php?page=sec_logout" class="text-xl mx-2 text-red-500 hover:text-gray-300">Logout</a>
                  </div>
                </div>
              </div>
            </div>
          </div>
          {{endwith login}}
          <ul class="flex items-center space-x-4">
            <li><a href="index.php?page=Home_Home" class="bg-gray-500 hover:bg-purple-700 font-bold py-2 px-4 rounded-full">Home</a></li>
            {{if ~isCLS}}
            <li><a href="index.php?page=Search_Search" class="bg-gray-500 hover:bg-purple-700 font-bold py-2 px-4 rounded-full">Discover</a></li>
            <li><a href="index.php?page=Playlists_Playlist" class="bg-gray-500 hover:bg-purple-700 font-bold py-2 px-4 rounded-full">Playlists</a></li>
            <li><a href="index.php?page=Songs_Song" class="bg-gray-500 hover:bg-purple-700 font-bold py-2 px-4 rounded-full">Music</a></li>
            <li><a href="index.php?page=Videos_Video" class="bg-gray-500 hover:bg-purple-700 font-bold py-2 px-4 rounded-full">Videos</a></li>
            <li><a href="index.php?page=Artists_Artist" class="bg-gray-500 hover:bg-purple-700 font-bold py-2 px-4 rounded-full">Artists</a></li>
            <li><a href="index.php?page=Albums_Album" class="bg-gray-500 hover:bg-purple-700 font-bold py-2 px-4 rounded-full">Albums</a></li>
            {{endif ~isCLS}}
            {{ifnot ~isADMIN}}
            <li><a href="index.php?page=Store_Store" class="bg-gray-500 hover:bg-purple-700 font-bold py-2 px-4 rounded-full">Store</a></li>
            <li><a href="index.php?page=Store_ShoppingCart" class="bg-gray-500 hover:bg-purple-700 font-bold py-2 px-4 rounded-full">Cart</a></li>
            <li><a href="index.php?page=Purchases_Purchase" class="bg-gray-500 hover:bg-purple-700 font-bold py-2 px-4 rounded-full">Purchases</a></li>
            {{endifnot ~isADMIN}}
            {{if ~isADMIN}}



            {{endif ~isADMIN}}

            {{if ~isAUDIT}}

            {{endif ~isAUDIT}}
          </ul>
        </nav>
      </header>
      
      <div class="container align-center justify-center">
        <div class="mt-16 mx-auto mb-16 text-white">
          {{{page_content}}}
        </div>
      </div>
     
    </section>
        
   
  </main>
  
</body>


  {{foreach EndScripts}}
  <script src="/{{~BASE_DIR}}/{{this}}"></script>
  {{endfor EndScripts}}
  <script>
    import Highway from '@dogstudio/highway/src/highway';
  </script>
  <script type="module">
    // Import the functions you need from the SDKs you need
    import { initializeApp } from "https://www.gstatic.com/firebasejs/10.6.0/firebase-app.js";
    import { getAnalytics } from "https://www.gstatic.com/firebasejs/10.6.0/firebase-analytics.js";
    // TODO: Add SDKs for Firebase products that you want to use
    // https://firebase.google.com/docs/web/setup#available-libraries
  
    // Your web app's Firebase configuration
    // For Firebase JS SDK v7.20.0 and later, measurementId is optional
    const firebaseConfig = {
      apiKey: "AIzaSyATwKVjzXVNNNFdbgrBAzLVTM6eB-FWUkw",
      authDomain: "skulllcandl.firebaseapp.com",
      projectId: "skulllcandl",
      storageBucket: "skulllcandl.appspot.com",
      messagingSenderId: "814076910954",
      appId: "1:814076910954:web:4716cabe516c677353d913",
      measurementId: "G-NGMVYML38B"
    };
  
    // Initialize Firebase
    const app = initializeApp(firebaseConfig);
    const analytics = getAnalytics(app);
  </script>
  <script>
   
    const menuList = document.getElementById('menuList');
    const menuButton = document.getElementById('menuButton');
    
    menuButton.addEventListener('click', () => {
        menuList.classList.toggle('hidden');
    });
  </script>
</body>
</html>
