<div class="text-center mt-8">
  <h2 class="text-4xl font-bold text-red-600">Oops.</h2>
  <h3 class="text-2xl mt-4">Error {{CLIENT_ERROR_CODE}}, {{CLIENT_ERROR_MSG}}</h3>
  <div>
      <img src="https://th.bing.com/th/id/R.77c58e2585b1d48c7f22dddffb575b95?rik=G%2fTIsc93hCbW9Q&pid=ImgRaw&r=0" alt="Error GIF" class="mx-auto my-8 max-w-full h-auto">
  </div>
  {{if DEVELOPMENT}}
      <hr class="my-8">
      <h2 class="text-xl">Error Code: {{ERROR_CODE}}</h2>
      <h3 class="text-lg">{{ERROR_MSG}}</h3>
      <hr class="my-8">
  {{endif DEVELOPMENT}}
</div>

