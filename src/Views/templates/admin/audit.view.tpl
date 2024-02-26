
<div class="container grid sm:grid-cols-1 sm:grid-cols-2 md:grid-cols-3 lg:grid-cols-3 xl:grid-cols-4 gap-6 mx-2">
  {{foreach control}}
  <div class="bg-white rounded-lg overflow-hidden shadow-md hover:shadow-lg transition duration-300 transform hover:-translate-y-1">
    <div class="p-4">
        <a href="{{url}}" class="text-blue-500 hover:text-blue-700 hover:underline transition duration-300">
            <h3 class="text-lg font-semibold mb-2">{{title}}</h3>
        </a>
    </div>
</div>
    {{endfor control}}
</div>
