
<div class="bg-white bg-opacity-20 backdrop-filter backdrop-blur-lg mx-auto">
  <div class="bg-cover bg-center min-h-screen object-cover" style="background-image: url('/{{BASE_DIR}}/public/imgs/hero/hero.jpg')">
    <div class="flex items-center justify-center h-full text-center text-white">
      <div class="pt-60">
        <h2 class="text-4xl sm:text-5xl md:text-7xl font-bold mb-5">Made for you</h2>
        <p class="text-lg sm:text-xl md:text-2xl">Discover music tailored to your taste.</p>
      </div>
    </div>
    
  </div>
  
  <div class='grid grid-cols-1 sm:grid-cols-2 bg-gradient-to-t from-purple-100 to-purple-300 min-h-screen p-6 md:p-20'>
    <div class="flex items-center justify-center text-center text-white">
        <div class="p-6">
            <h2 class="text-4xl sm:text-5xl md:text-7xl font-bold mb-5">We Are</h2>
        </div>
    </div>
    <div class="grid grid-cols-2 sm:grid-cols-2 gap-6">
        <div class="bg-white rounded-lg overflow-hidden shadow-md p-4">
            <img src="/{{BASE_DIR}}/public/imgs/post/aboutUs.jpeg" alt="About Us Image" class="w-full h-48 object-cover object-center">
            <div class="p-4">
                <h3 class="text-lg text-blue-500 font-semibold mb-2">About us</h3>
                <p class="text-gray-700">Who we are?</p>
                <div class="flex justify-between mt-4">
                    <a href="index.php?page=Company_AboutUs" class="bg-pink-500 hover:bg-pink-900 text-white px-4 py-2 rounded-full">Learn More</a>
                </div>
            </div>
        </div>

        <div class="bg-white rounded-lg overflow-hidden shadow-md p-4">
            <img src="/{{BASE_DIR}}/public/imgs/post/prices.jpeg" alt="Prices Image" class="w-full h-48 object-cover object-center">
            <div class="p-4">
                <h3 class="text-lg text-blue-500 font-semibold mb-2">Pricing</h3>
                <p class="text-gray-700">Dive dive into our plans</p>
                <div class="flex justify-between mt-4">
                    <a href="index.php?page=Company_Plans" class="bg-pink-500 hover:bg-pink-900 text-white px-4 py-2 rounded-full">Learn More</a>
                </div>
            </div>
        </div>

        <div class="bg-white rounded-lg overflow-hidden shadow-md p-4">
            <img src="/{{BASE_DIR}}/public/imgs/post/services.jpeg" alt="Services Image" class="w-full h-48 object-cover object-center">
            <div class="p-4">
                <h3 class="text-lg text-blue-500 font-semibold mb-2">Services</h3>
                <p class="text-gray-700">What we offer?</p>
                <div class="flex justify-between mt-4">
                    <a href="index.php?page=Company_Services" class="bg-pink-500 hover:bg-pink-900 text-white px-4 py-2 rounded-full">Learn More</a>
                </div>
            </div>
        </div>
        
        <div class="bg-white rounded-lg overflow-hidden shadow-md p-4">
          <img src="/{{BASE_DIR}}/public/imgs/post/disco4.jpeg" alt="Services Image" class="w-full h-48 object-cover object-center">
          <div class="p-4">
              <h3 class="text-lg text-blue-500 font-semibold mb-2">Store</h3>
              <p class="text-gray-700">Coming Soon</p>
              <div class="flex justify-between mt-4">
                  <a href="#store" class="bg-pink-500 hover:bg-pink-900 text-white px-4 py-2 rounded-full">Learn More</a>
              </div>
          </div>
      </div>
    </div>
</div>

    <div class="bg-cover bg-center min-h-screen object-cover" style="background-image: url('/{{BASE_DIR}}/public/imgs/hero/hero2.jpg')">
      <div class="flex items-center justify-center h-full text-center text-white">
        <div class="pt-60">
          <h2 class="text-4xl sm:text-5xl md:text-7xl font-bold mb-5">More than music</h2>
          <p class="text-lg sm:text-xl md:text-2xl">Explore an infinite world of countless posibilities</p>
        </div>
      </div>
      
    </div>
    
    
    <section class="grid place-items-center min-h-screen p-20 mt-10 px-24">
      <div>
        <h1 class="text-4xl sm:text-5xl md:text-7xl font-bold text-gray-200 mb-5">Made for you</h1>
        <section class="grid grid-cols-1 sm:grid-cols-3 gap-4">
          <div class="bg-gray-900 shadow-lg rounded p-3">
            <div class="group relative">
              <img class="w-full md:w-72 block rounded" src="https://upload.wikimedia.org/wikipedia/en/f/f1/Tycho_-_Epoch.jpg" alt="" />
              <div class="absolute bg-black rounded bg-opacity-0 group-hover:bg-opacity-60 w-full h-full top-0 flex items-center group-hover:opacity-100 transition justify-evenly">
                <button class="hover:scale-110 text-white opacity-0 transform translate-y-3 group-hover:translate-y-0 group-hover:opacity-100 transition">
                  <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor" class="bi bi-heart" viewBox="0 0 16 16">
                    <path d="M8 2.748l-.717-.737C5.6.281 2.514.878 1.4 3.053c-.523 1.023-.641 2.5.314 4.385.92 1.815 2.834 3.989 6.286 6.357 3.452-2.368 5.365-4.542 6.286-6.357.955-1.886.838-3.362.314-4.385C13.486.878 10.4.28 8.717 2.01L8 2.748zM8 15C-7.333 4.868 3.279-3.04 7.824 1.143c.06.055.119.112.176.171a3.12 3.12 0 0 1 .176-.17C12.72-3.042 23.333 4.867 8 15z" />
                  </svg>
                </button>
    
                <button id="song1" class="hover:scale-110 text-white opacity-0 transform translate-y-3 group-hover:translate-y-0 group-hover:opacity-100 transition">
                     <audio id="audioPlayer1" src="https://firebasestorage.googleapis.com/v0/b/skulllcandl.appspot.com/o/Tycho%20%20Epoch.mp3?alt=media&token=c07ab7a9-012f-4539-a0be-63a7d3588d50" style="display: none;"></audio>
                  <svg xmlns="http://www.w3.org/2000/svg" width="40" height="40" fill="currentColor" class="bi bi-play-circle-fill" viewBox="0 0 16 16">
                    <path d="M16 8A8 8 0 1 1 0 8a8 8 0 0 1 16 0zM6.79 5.093A.5.5 0 0 0 6 5.5v5a.5.5 0 0 0 .79.407l3.5-2.5a.5.5 0 0 0 0-.814l-3.5-2.5z" />
                  </svg>
                </button>
    
                <button class="hover:scale-110 text-white opacity-0 transform translate-y-3 group-hover:translate-y-0 group-hover:opacity-100 transition">
                  <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor" class="bi bi-three-dots" viewBox="0 0 16 16">
                    <path d="M3 9.5a1.5 1.5 0 1 1 0-3 1.5 1.5 0 0 1 0 3zm5 0a1.5 1.5 0 1 1 0-3 1.5 1.5 0 0 1 0 3zm5 0a1.5 1.5 0 1 1 0-3 1.5 1.5 0 0 1 0 3z" />
                  </svg>
                </button>
              </div>
            </div>
            <div class="p-5">
              <h3 class="text-white text-lg">Epoch</h3>
              <p class="text-gray-400">Tycho</p>
            </div>
          </div>
    
          <div class="bg-gray-900 shadow-lg rounded p-3">
            <div class="group relative">
              <img class="w-full md:w-72 block rounded" src="https://upload.wikimedia.org/wikipedia/en/c/ca/Tycho_-_Awake.png" alt="" />
              <div class="absolute bg-black rounded bg-opacity-0 group-hover:bg-opacity-60 w-full h-full top-0 flex items-center group-hover:opacity-100 transition justify-evenly">
                <button class="hover:scale-110 text-white opacity-0 transform translate-y-3 group-hover:translate-y-0 group-hover:opacity-100 transition">
                  <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor" class="bi bi-heart" viewBox="0 0 16 16">
                    <path d="M8 2.748l-.717-.737C5.6.281 2.514.878 1.4 3.053c-.523 1.023-.641 2.5.314 4.385.92 1.815 2.834 3.989 6.286 6.357 3.452-2.368 5.365-4.542 6.286-6.357.955-1.886.838-3.362.314-4.385C13.486.878 10.4.28 8.717 2.01L8 2.748zM8 15C-7.333 4.868 3.279-3.04 7.824 1.143c.06.055.119.112.176.171a3.12 3.12 0 0 1 .176-.17C12.72-3.042 23.333 4.867 8 15z" />
                  </svg>
                </button>
    
                <button id="song2" class="hover:scale-110 text-white opacity-0 transform translate-y-3 group-hover:translate-y-0 group-hover:opacity-100 transition">
                  <audio id="audioPlayer2" src="https://firebasestorage.googleapis.com/v0/b/skulllcandl.appspot.com/o/Tycho%20%20Awake.mp3?alt=media&token=5872e0f9-56b7-4fbd-9178-0e61155c5d45" style="display: none;"></audio>
                  <svg xmlns="http://www.w3.org/2000/svg" width="40" height="40" fill="currentColor" class="bi bi-play-circle-fill" viewBox="0 0 16 16">
                    <path d="M16 8A8 8 0 1 1 0 8a8 8 0 0 1 16 0zM6.79 5.093A.5.5 0 0 0 6 5.5v5a.5.5 0 0 0 .79.407l3.5-2.5a.5.5 0 0 0 0-.814l-3.5-2.5z" />
                  </svg>
                </button>
    
                <button class="hover:scale-110 text-white opacity-0 transform translate-y-3 group-hover:translate-y-0 group-hover:opacity-100 transition">
                  <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor" class="bi bi-three-dots" viewBox="0 0 16 16">
                    <path d="M3 9.5a1.5 1.5 0 1 1 0-3 1.5 1.5 0 0 1 0 3zm5 0a1.5 1.5 0 1 1 0-3 1.5 1.5 0 0 1 0 3zm5 0a1.5 1.5 0 1 1 0-3 1.5 1.5 0 0 1 0 3z" />
                  </svg>
                </button>
              </div>
            </div>
            <div class="p-5">
              <h3 class="text-white text-lg">Awake</h3>
              <p class="text-gray-400">Tycho</p>
            </div>
          </div>
    
          <div class="bg-gray-900 shadow-lg rounded p-3">
            <div class="group relative">
              <img class="w-full md:w-72 block rounded" src="https://upload.wikimedia.org/wikipedia/en/1/11/Dive_tycho_album.jpg" alt="" />
              <div class="absolute bg-black rounded bg-opacity-0 group-hover:bg-opacity-60 w-full h-full top-0 flex items-center group-hover:opacity-100 transition justify-evenly">
                <button class="hover:scale-110 text-white opacity-0 transform translate-y-3 group-hover:translate-y-0 group-hover:opacity-100 transition">
                  
                  <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor" class="bi bi-heart" viewBox="0 0 16 16">
                    <path d="M8 2.748l-.717-.737C5.6.281 2.514.878 1.4 3.053c-.523 1.023-.641 2.5.314 4.385.92 1.815 2.834 3.989 6.286 6.357 3.452-2.368 5.365-4.542 6.286-6.357.955-1.886.838-3.362.314-4.385C13.486.878 10.4.28 8.717 2.01L8 2.748zM8 15C-7.333 4.868 3.279-3.04 7.824 1.143c.06.055.119.112.176.171a3.12 3.12 0 0 1 .176-.17C12.72-3.042 23.333 4.867 8 15z" />
                  </svg>
                </button>
    
                <button id="song3" class="hover:scale-110 text-white opacity-0 transform translate-y-3 group-hover:translate-y-0 group-hover:opacity-100 transition">
                  <audio id="audioPlayer3" src="https://firebasestorage.googleapis.com/v0/b/skulllcandl.appspot.com/o/Tycho%20Dive.m4a?alt=media&token=e73fa2f4-66c8-4ed8-be3e-eb75adf0eca1" style="display: none;"></audio>
                  <svg xmlns="http://www.w3.org/2000/svg" width="40" height="40" fill="currentColor" class="bi bi-play-circle-fill" viewBox="0 0 16 16">
                    <path d="M16 8A8 8 0 1 1 0 8a8 8 0 0 1 16 0zM6.79 5.093A.5.5 0 0 0 6 5.5v5a.5.5 0 0 0 .79.407l3.5-2.5a.5.5 0 0 0 0-.814l-3.5-2.5z" />
                  </svg>
                </button>
    
                <button class="hover:scale-110 text-white opacity-0 transform translate-y-3 group-hover:translate-y-0 group-hover:opacity-100 transition">
                  <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor" class="bi bi-three-dots" viewBox="0 0 16 16">
                    <path d="M3 9.5a1.5 1.5 0 1 1 0-3 1.5 1.5 0 0 1 0 3zm5 0a1.5 1.5 0 1 1 0-3 1.5 1.5 0 0 1 0 3zm5 0a1.5 1.5 0 1 1 0-3 1.5 1.5 0 0 1 0 3z" />
                  </svg>
                </button>
              </div>
            </div>
            <div class="p-5">
              <h3 class="text-white text-lg">Dive</h3>
              <p class="text-gray-400">Tycho</p>
            </div>
          </div>
        </section>
      </div>
    </section>
</div>


<div class="bg-gray-900 min-h-screen object-cover">
  <div class="flex items-center justify-center h-full text-center text-white">
    <div class="pt-60">
      <h2 class="text-4xl sm:text-5xl md:text-7xl font-bold mb-5">Coming</h2>
      <p class="text-lg sm:text-xl md:text-2xl">Purchase your favorite artists' merch</p>
    </div>
  </div>
  
</div>

<section class="py-10 bg-gray-100" id="store">
  <h2 class="text-black text-3xl text-center">Your Beloved Artists' Merch</h2>
  <div class="mx-auto grid max-w-6xl  grid-cols-1 gap-6 p-6 sm:grid-cols-2 md:grid-cols-3 lg:grid-cols-4">
    {{foreach products}}
    <article class="rounded-xl bg-white p-3 shadow-lg hover:shadow-xl hover:transform hover:scale-105 duration-300 ">
      <a href="#">
        <div class="relative flex items-end overflow-hidden rounded-xl">
          <img src="{{imageUrl}}" alt="Merch" />
          <div class="flex items-center space-x-1.5 rounded-lg bg-blue-500 px-4 py-1.5 text-white duration-100 hover:bg-blue-600">
            <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" class="h-4 w-4">
              <path stroke-linecap="round" stroke-linejoin="round" d="M2.25 3h1.386c.51 0 .955.343 1.087.835l.383 1.437M7.5 14.25a3 3 0 00-3 3h15.75m-12.75-3h11.218c1.121-2.3 2.1-4.684 2.924-7.138a60.114 60.114 0 00-16.536-1.84M7.5 14.25L5.106 5.272M6 20.25a.75.75 0 11-1.5 0 .75.75 0 011.5 0zm12.75 0a.75.75 0 11-1.5 0 .75.75 0 011.5 0z" />
            </svg>
            <button class="text-sm">Add to cart</button>
          </div>
        </div>

        <div class="mt-1 p-2">
          <h2 class="text-black text-3xl">{{artist}}</h2>
          <p class="text-blue-500">{{product}}</p>

          <div class="mt-3 flex items-end justify-between">
              <p class="text-lg font-bold text-blue-500">{{price}}</p>

            <div class="flex items-center space-x-1.5 rounded-lg bg-blue-500 px-4 py-1.5 text-white duration-100 hover:bg-blue-600">
              <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" class="h-4 w-4">
                <path stroke-linecap="round" stroke-linejoin="round" d="M2.25 3h1.386c.51 0 .955.343 1.087.835l.383 1.437M7.5 14.25a3 3 0 00-3 3h15.75m-12.75-3h11.218c1.121-2.3 2.1-4.684 2.924-7.138a60.114 60.114 0 00-16.536-1.84M7.5 14.25L5.106 5.272M6 20.25a.75.75 0 11-1.5 0 .75.75 0 011.5 0zm12.75 0a.75.75 0 11-1.5 0 .75.75 0 011.5 0z" />
              </svg>

              <button class="text-sm" id="showShoppingCart{{id}}">Add to cart</button>
            </div>
          </div>
        </div>
      </a>
    </article>

    

    {{endfor products}}
  </div>

  </section>
  <div class="bg-cover bg-center min-h-screen object-cover" style="background-image: url('/{{BASE_DIR}}/public/imgs/hero/hero4.jpg')">
  <div class="flex items-center justify-center h-full text-center text-white">
    <div class="pt-60">
      <h2 class="text-4xl sm:text-5xl md:text-7xl font-bold mb-5">Coming</h2>
      <p class="text-lg sm:text-xl md:text-2xl">Concerts Nearby You</p>
    </div>
  </div>
  
</div>



  <script>
  const audioPlayer = document.getElementById('audioPlayer1');
  const playButton = document.getElementById('song1');


  playButton.addEventListener('click', function() {
    if (audioPlayer.paused) {
      audioPlayer.play(); 
    } else {
      audioPlayer.pause(); 
    }
  });
  const audioPlayer2 = document.getElementById('audioPlayer2');
  const playButton2 = document.getElementById('song2');


  playButton2.addEventListener('click', function() {
    if (audioPlayer2.paused) {
      audioPlayer2.play(); 
    } else {
      audioPlayer2.pause(); 
    }
  });
    const audioPlayer3 = document.getElementById('audioPlayer3');
  const playButton3 = document.getElementById('song3');


  playButton3.addEventListener('click', function() {
    if (audioPlayer3.paused) {
      audioPlayer3.play(); 
    } else {
      audioPlayer3.pause(); 
    }
  });
  </script>
