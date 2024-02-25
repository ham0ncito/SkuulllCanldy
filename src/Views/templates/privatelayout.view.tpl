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
  <main class="mx-auto items-center justify-around">
    <section class="w-full h-screen md:w-2/3  justify-around">
      <header class="mb-4 text-white py-4 my-4 mx-auto flex items-center justify-between">
        <nav id="menu" class="flex flex-wrap py-4 mx-auto justify-around space-x-4">
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
                      <div class="sm:flex sm:items-start">
                        <img class="m-auto h-14 w-14 rounded-full" src="https://th.bing.com/th/id/OIP.Gfp0lwE6h7139625a-r3aAHaHa?rs=1&pid=ImgDetMain" alt="Profile photo">
                        <div class="mt-3 text-center sm:text-left sm:ml-4">
                            <h3 class="text-lg font-medium leading-6 text-gray-900 whitespace-normal sm:whitespace-nowrap" id="modal-title">Your profile</h3>
                            <div class="mt-2">
                                <p class="text-sm text-gray-500">Username: <span class="font-bold">{{username}}</span></p>
                                
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
            <li><a href="index.php?page=Home_Home" class="bg-gray-500 hover:bg-purple-700 p-2 font-bold rounded-full">Home</a></li>
            {{if ~isCLS}}
            <li><a href="index.php?page=Search_Search" class="bg-gray-500 hover:bg-purple-700 p-2 font-bold rounded-full">Discover</a></li>
            <li><a href="index.php?page=Playlists_Playlist" class="bg-gray-500 hover:bg-purple-700 p-2 font-bold rounded-full">Playlists</a></li>
            <li><a href="index.php?page=Songs_Song" class="bg-gray-500 hover:bg-purple-700 p-2 font-bold rounded-full">Music</a></li>
            <li><a href="index.php?page=Videos_Video" class="bg-gray-500 hover:bg-purple-700 p-2 font-bold rounded-full">Videos</a></li>
            <li><a href="index.php?page=Artists_Artist" class="bg-gray-500 hover:bg-purple-700 p-2 font-bold rounded-full">Artists</a></li>
            <li><a href="index.php?page=Albums_Album" class="bg-gray-500 hover:bg-purple-700 p-2 font-bold rounded-full">Albums</a></li>
            {{endif ~isCLS}}
            {{ifnot ~isADMIN}}
            <li><a href="index.php?page=Store_Store" class="bg-gray-500 hover:bg-purple-700 p-2 font-bold rounded-full">Store</a></li>
            <li><a href="index.php?page=Store_ShoppingCart" class="bg-gray-500 hover:bg-purple-700 p-2 font-bold rounded-full">Cart</a></li>
            <li><a href="index.php?page=Purchases_Purchase" class="bg-gray-500 hover:bg-purple-700 p-2 font-bold rounded-full">Purchases</a></li>
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
