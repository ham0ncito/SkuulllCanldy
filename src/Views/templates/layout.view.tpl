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
<body class="bg-black-100 h-screen">
  <header class="bg-gray-900 text-white w-full">
    <div class="container mx-auto flex items-center justify-between py-4">
        <div class="flex items-center mx-4 md:mx-12"> 
            <div class="w-10 h-10 md:w-16 md:h-16 bg-gray-200 rounded-full">
                <a href="index.php?page=Index">
                    <img src="/{{BASE_DIR}}/public/imgs/logo/logoSkuul.png" alt="Logo" class="w-full h-full object-cover" />
                </a>
            </div>
            <h2 class="text-lg md:text-xl font-bold mr-2 md:mr-4 pl-2 md:pl-4">
                <a href="https://firebasestorage.googleapis.com/v0/b/skulllcandl.appspot.com/o/Videos%2Fy2mate.com%20-%20Rick%20Astley%20%20Never%20Gonna%20Give%20You%20Up%20Official%20Music%20Video_1080p.mp4?alt=media&token=7e5931ce-f7bf-4f90-83aa-be0f3581909b">Skul2Canldy</a>
            </h2>
        </div>
        <nav class="flex items-center justify-center space-x-2 md:space-x-4 mx-4 md:mx-16"> 
          <button class="md:hidden focus:outline-none" onclick="toggleMenu()">
              <svg xmlns="http://www.w3.org/2000/svg" class="h-6 w-6" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                  <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M4 6h16M4 12h16m-7 6h7"></path>
              </svg>
          </button>
          
          <ul id="mobileMenu" class="hidden md:flex items-center space-x-2 md:space-x-6 text-center" x-data="{ currentPage: window.location.pathname }">
            <li id="homeLink" class="w-20 md:w-auto" :class="{ 'bg-pink-500 text-white': currentPage === '/index.php?page={{PUBLIC_DEFAULT_CONTROLLER}}' }">
                <a href="index.php?page={{PUBLIC_DEFAULT_CONTROLLER}}" class="text-white hover:text-pink-500">Home</a>
            </li>
            <li id="homeLink" class="w-20 md:w-auto" :class="{ 'bg-pink-500 text-white': currentPage === '/index.php?page={{PUBLIC_DEFAULT_CONTROLLER}}' }">
              <a href="index.php?page=Company_Services" class="text-white hover:text-pink-500">Services</a>
          </li>
            <li id="storeLink" class="w-20 md:w-auto" :class="{ 'bg-pink-500 text-white': currentPage === 'index.php?page={{PUBLIC_DEFAULT_CONTROLLER}}#store' }">
              <a href="index.php?page=Company_Plans" class="text-white hover:text-pink-500">Pricing</a>
          </li>
            {{foreach PUBLIC_NAVIGATION}}
            <li class="w-20 md:w-auto" :class="{ 'bg-pink-500 text-white': currentPage === '{{nav_url}}' }">
                <a href="{{nav_url}}" class="text-white hover:text-pink-500">{{nav_label}}</a>
            </li>
            {{endfor PUBLIC_NAVIGATION}}
        </ul>
        
        
      </nav>
      
      
    </div>
</header>

  <main class="bg-gradient-to-r from-gray-900 to-indigo-900 flex-grow">
    <div class="container mx-auto py-">
      <div class="flex items-center justify-around">
        <div class="w-full rounded-lg text-white">
          {{{page_content}}}
        </div>
      </div>
    </div>
  </main>  

 
  <footer class="bg-gray-900 text-white py-14">
    <div class="container mx-auto grid grid-cols-1 md:grid-cols-2 lg:grid-cols-4 gap-8">
      
      <div>
        <div class="flex mb-8 items-center justify-center">
          <div class="w-16 h-16 bg-white rounded-full flex items-center justify-center">
            <img src="/{{BASE_DIR}}/public/imgs/logo/logoSkuul.png" alt="Logo" class="w-10 h-10 md:w-12 md:h-12 object-cover" />
          </div>
          <a href="index.php?page=Index" class="font-semibold text-4xl hover:text-pink-500 pl-4 hover:text-6xl transition duration-300">Skul2Canldy</a>
        </div>
        <div class="space-around center flex space-around items-center">
          <span class="font-semibold text-lg text-2xl p-4 hover:text-blue-500 transition duration-300">Social</span>
          <div class="flex items-center space-x-4 mt-2">
            <a href="https://www.facebook.com/" class="w-12 h-12 bg-gray-200 hover:bg-blue-500 rounded-full flex items-center justify-center transition duration-300">
              <img src="/{{BASE_DIR}}/public/imgs/social/facebook.png" alt="Facebook" class="w-6 h-6 md:w-8 md:h-8 object-cover"/>
            </a>
            <a href="https://www.twitter.com/" class="w-12 h-12 bg-gray-200 hover:bg-blue-500 rounded-full flex items-center justify-center transition duration-300">
              <img src="/{{BASE_DIR}}/public/imgs/social/twitter.png" alt="Twitter" class="w-6 h-6 md:w-8 md:h-8 object-cover"/>
            </a>
            <a href="https://www.instagram.com/" class="w-12 h-12 bg-gray-200 hover:bg-blue-500 rounded-full flex items-center justify-center transition duration-300">
              <img src="/{{BASE_DIR}}/public/imgs/social/instagram.png" alt="Instagram" class="w-6 h-6 md:w-8 md:h-8 object-cover"/>
            </a>
          </div>
        </div>
      </div>
     
      <div class="col-span-3 grid grid-cols-1 md:grid-cols-3 gap-8">
        <div class="p-4">
          <a href="index.php?page=Company_Company" class="font-semibold text-3xl hover:text-pink-500 transition duration-300">Company</a>
          <ul class="space-y-2 p-4">
            <li class="hover:text-blue-500 transition duration-300"><a href="index.php?page=Company_AboutUs">About Us</a></li>
            <li class="hover:text-blue-500 transition duration-300"><a href="index.php?page=Company_Jobs">Jobs</a></li>
            <li class="hover:text-blue-500 transition duration-300"><a href="index.php?page=Company_ForTheRecord">For the Record</a></li>
          </ul>
        </div>
      
        <div class="p-4">
          <a href="index.php?page=Communities_Communities" class="font-semibold text-3xl hover:text-pink-500 transition duration-300">Communities</a>
          <ul class="space-y-2 p-4">
            <li class="hover:text-blue-500 transition duration-300"><a href="index.php?page=Communities_Artists">For Artists</a></li>
            <li class="hover:text-blue-500 transition duration-300"><a href="index.php?page=Communities_Developers">Developers</a></li>
            <li class="hover:text-blue-500 transition duration-300"><a href="index.php?page=Communities_Investors">Investors</a></li>
            <li class="hover:text-blue-500 transition duration-300"><a href="index.php?page=Communities_Vendors">Vendors</a></li>
          </ul>
        </div>
      
        <div class="p-4">
          <a href="index.php?page=Useful_Useful" class="font-semibold text-3xl hover:text-pink-500 transition duration-300">Useful Links</a>
          <ul class="space-y-2 p-4">
            <li class="hover:text-blue-500 transition duration-300"><a href="index.php?page=Useful_Support">Support</a></li>
            <li class="hover:text-blue-500 transition duration-300"><a href="index.php?page=Useful_WebPlayer">Web Player</a></li>
            <li class="hover:text-blue-500 transition duration-300"><a href="index.php?page=Useful_App">App</a></li>
          </ul>
        </div>
      </div>
    </div>

  
    <button onclick="scrollToTop()" class="fixed bottom-8 right-8 bg-blue-500 text-white p-2 rounded-full shadow-md hover:bg-blue-600 focus:outline-none transition-colors duration-300">
      <svg xmlns="http://www.w3.org/2000/svg" class="h-6 w-6 inline-block m-auto" fill="none" viewBox="0 0 24 24" stroke="currentColor">
        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M5 10l7-7m0 0l7 7m-7-7v18"></path>
      </svg>
    </button>
  </footer>
  
  

  
  {{foreach EndScripts}}
    <script src="/{{~BASE_DIR}}/{{this}}"></script>
  {{endfor EndScripts}}
  <script>
    function toggleMenu() {
      var mobileMenu = document.getElementById("mobileMenu");
      if (mobileMenu.classList.contains("hidden")) {
        mobileMenu.classList.remove("hidden");
      } else {
        mobileMenu.classList.add("hidden");
      }
    }
  </script>
  <script>
    
    function scrollToTop() {
      window.scrollTo({
        top: 0,
        behavior: 'smooth'
      });
    }

    function scrollToSection(sectionId) {
      var section = document.getElementById(sectionId);
      if (section) {
        section.scrollIntoView({
          behavior: 'smooth'
        });
      }
    }
  </script>


</body>
</html>
