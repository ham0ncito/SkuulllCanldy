<style>
    .shadow-drop-center{-webkit-animation:shadow-drop-center .4s cubic-bezier(.25,.46,.45,.94) both;animation:shadow-drop-center .4s cubic-bezier(.25,.46,.45,.94) both}
    .jello-horizontal{-webkit-animation:jello-horizontal .9s both;animation:jello-horizontal .9s both}
    .heartbeat{-webkit-animation:heartbeat 1.5s ease-in-out infinite both;animation:heartbeat 1.5s ease-in-out infinite both}
</style>
 
<section class="bg-white bg-opacity-20 backdrop-filter backdrop-blur-lg  h-screen min-h-screen py-12 ">
   <h2 class="text-pink-500 text-6xl m-4 mb-8 justify-center text-center">Check our {{page}}</h2>
   <div class=" flex items-center justify-center ">
  <div class="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-3 gap-6">
    {{foreach prices}}
   <div class="bg-white heartbeat shadow-drop-center rounded-lg overflow-hidden shadow-lg transition-transform transform hover:scale-105">
      <div class="p-1 bg-{{color}}">
      </div>
      <div class="p-8">
        <h2 class="text-3xl font-bold text-{{color2}} mb-4">{{name}}</h2>
        <p class="text-gray-600 mb-6">{{description}}</p>
        <p class="text-4xl font-bold text-{{color4}} mb-6">{{price}}</p>
        <ul class="text-sm text-gray-600 mb-6">
          <li class="mb-2 flex items-center">
            <svg class="w-4 h-4 mr-2 text-{{color2}}" fill="none" stroke="currentColor" viewBox="0 0 24 24"
              xmlns="http://www.w3.org/2000/svg">
              <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                d="M5 13l4 4L19 7"></path>
            </svg>
           {{char1}}
          </li>
          <li class="mb-2 flex items-center">
            <svg class="w-4 h-4 mr-2 text-{{color2}}" fill="none" stroke="currentColor" viewBox="0 0 24 24"
              xmlns="http://www.w3.org/2000/svg">
              <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                d="M5 13l4 4L19 7"></path>
            </svg>
             {{char2}}
          </li>
          <li class="flex items-center">
            <svg class="w-4 h-4 mr-2 text-{{color2}}" fill="none" stroke="currentColor" viewBox="0 0 24 24"
              xmlns="http://www.w3.org/2000/svg">
              <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                d="M5 13l4 4L19 7"></path>
            </svg>
            {{char3}}
          </li>
        </ul>
      </div>
      <div class="p-6 w-full bg-{{color3}} jello-horizontal ">
        <a href="index.php?page=Sec_Login&buy={{id}}"
          class="w-full jello-horizontal bg-{{color2}} text-white rounded-full px-4 py-2 hover:bg-{{color3}} focus:outline-none focus:shadow-outline-blue active:bg-{{color4}}">
          Select Plan
        </a>
      </div>
    </div> 
  {{endfor prices}}
  </div>
  </div>
</section>
