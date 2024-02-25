<div class="text-center mt-8 " x-data="{ openModal: false }">
  <h2 class="text-4xl font-bold text-red-600 animate-bounce">Oops!</h2>
  <h3 class="text-2xl mt-4">{{CLIENT_ERROR_MSG}}</h3>
  <div>
    <img src="https://th.bing.com/th/id/R.77c58e2585b1d48c7f22dddffb575b95?rik=G%2fTIsc93hCbW9Q&pid=ImgRaw&r=0" alt="Error GIF" class="mx-auto my-8 max-w-full h-auto ">
  </div>
  <button @click="openModal = true" class="mt-4 bg-blue-500 hover:bg-blue-700 text-white font-bold py-2 px-4 rounded">Show Error</button>

  <div x-show="openModal" class="fixed z-10 inset-0 overflow-y-auto" aria-labelledby="modal-title" role="dialog" aria-modal="true">
    <div class="flex items-end justify-center min-h-screen pt-4 px-4 pb-20 text-center sm:block sm:p-0">
      <div class="fixed inset-0 bg-gray-500 bg-opacity-75 transition-opacity" aria-hidden="true"></div>
      <span class="hidden sm:inline-block sm:align-middle sm:h-screen" aria-hidden="true">&#8203;</span>
      <div class="inline-block align-bottom bg-white rounded-lg text-left overflow-hidden shadow-xl transform transition-all sm:my-8 sm:align-middle sm:max-w-lg sm:w-full">
        <div class="bg-white px-4 pt-5 pb-4 sm:p-6 sm:pb-4">
          <h3 class="text-lg font-medium leading-6 text-gray-900" id="modal-title">Error Details</h3>
          <div class="mt-2">
            <p class="text-sm text-gray-500 pt-2">Error Code: {{ERROR_CODE}}</p>
            {{if DEVELOPMENT}}
            <p class="text-sm text-gray-500 pb-2">Error Message: {{ERROR_MSG}}</p>
            {{endif DEVELOPMENT}}
          </div>
        </div>
        <div class="bg-gray-50 px-4 py-3 sm:px-6 sm:flex sm:flex-row-reverse">
          <button @click="openModal = false" type="button" class="w-full inline-flex justify-center rounded-md border border-transparent shadow-sm px-4 py-2 bg-blue-500 text-base font-medium text-white hover:bg-blue-700 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-blue-500 sm:ml-3 sm:w-auto sm:text-sm">
            Close
          </button>
        </div>
      </div>
    </div>
  </div>
</div>
