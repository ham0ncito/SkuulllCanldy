<div class="flex flex-col items-center w-full">
  {{ifnot isCLN}}
  <div class="mdtext-left mx-8 my-2">
    <h2 class="text-white text-6xl pb-4">Explore</h2>
    <form class="col-12 col-m-8" action="index.php" method=get >
      <div class="relative w-full mdw-auto mx-4 mb-4 ">
        <input type="hidden" name="page" value="Search_Search">
        <input type="text" placeholder="Search"
          class="border-2 w-full border-gray-300 bg-white h-10 px-5 pr-10 rounded-full text-sm focusoutline-none"
          name="partialName" id="partialName" value={{partialName}}>
        <button type="submit" class="absolute right-0 top-0 mt-3 mr-4">
          <svg class="h-4 w-4 fill-current text-gray-500" xmlns="httpwww.w3.org2000svg" viewBox="0 0 24 24">
            <path d="M15.5 14h-.79l-.28-.27a6.5 6.5 0 0 0 1.48-5.34c-.47-2.78-2.79-5-5.59-5.34a6.505 6.505 0 0 0-7.27 7.27c.34 2.8 2.56 5.12 5.34 5.59a6.5 6.5 0 0 0 5.34-1.48l.27.28v.79l4.25 4.25c.41.41 1.08.41 1.49 0 .41-.41.41-1.08 0-1.49L15.5 14zm-6 0C7.01 14 5 11.99 5 9.5S7.01 5 9.5 5 14 7.01 14 9.5 11.99 14 9.5 14z"/>
          </svg>
        </button>
    </form>
  
  <section class="SearchResultsList">
    <h4 class="text-white text-4xl pb-4">Songs</h4>
    <style>
      table {
        width:90%;
        border-collapse: collapse;
        margin-top: 20px;
        margin-left: 5%;
      }

      th, td {
        padding:10px;
        text-align:left;
      }

      th {
        background-color: #f2f2f2;
        width :fit-content;
      }

      .cover-cell {
        display :flex;
        align-items :left;
        width :fit-content;
      }

      .cover-image {
        margin-right: 10px;
      }

      .title-artist {
        display :flex;
        flex-direction: column;
        vertical-align :center;
      }

      img {
        display :block;
        margin: 0 auto;
      }
  </style>
    <table>
      <thead class="text-center justify-center mx-2">
        <tr>
          <td>#</td>
          <td>Title</td>
          <td>Album</td>
          <td>Release Date</td>
          <td>Duration</td>
        </tr>
      </thead>
      <tbody>
        {{foreach songs}}
        
        <tr>
          <td>{{row_number}}</td>
          <td class="cover-cell">
            <img src={{song_cover}} alt= height="75px" width="75px" class="cover-image">
            <div class="title-artist">
              <div>{{title_song}} </div>
              <div>{{name_artist}}</div>
            </div>
          </td>
          <td>{{title_album}}</td>
          <td>{{release_date_album}}</td>
          <td>{{duration}}</td>
        </tr>
      </tbody>
      {{endfor songs}}
    </table>
    {{pagination}}
  </section>

  <section>
    <h4 class="text-white text-4xl pb-4">Artists</h4>
        <div class="pt-10 pb-10 grid grid-cols-1 sm:grid-cols-2 md:grid-cols-3 lg:grid-cols-4 gap-6">
          {{foreach artists}}
            <div class="max-w-sm rounded-lg overflow-hidden shadow-lg relative">
              <a href=""></a>
              <img class="w-full h-60 object-cover" src={{image_artist}} alt={{name_artist}}>
              <div class="absolute inset-0 flex items-center justify-center opacity-0 hoveropacity-100        transition duration-300 bg-black bg-opacity-50">
                <p class="text-white text-center text-lg">{{name_artist}}</p>
              </div>
            </div>
          {{endfor artists}}
        </div>
  </section>
  <section>
    <h4 class="text-white text-4xl pb-4">Albums</h4>
      <div class="pt-10 pb-10 grid grid-cols-1 sm:grid-cols-2 md:grid-cols-3 lg:grid-cols-4 gap-6">
      {{foreach albums}}
      <div class="max-w-sm rounded-lg overflow-hidden shadow-lg relative">
        <a href=""></a>
        <img class="w-full h-60 object-cover" src="{{image_album}}" alt="{{title_album}}">
        <div class="absolute inset-0 flex items-center justify-center opacity-0 hover:opacity-100 transition duration-300 bg-black bg-opacity-50">
          <p class="text-white text-center text-lg">{{title_album}}</p>
        </div>
      </div>
      {{endfor albums}}
    </div>
  </section>
  <div>
  <h3 class="text-white text-4xl">Genre</h3>
    <div class="pt-10 pb-10 grid grid-cols-1 sm:grid-cols-2 md:grid-cols-3 lg:grid-cols-4 gap-6">
      {{foreach genre}}
      <div class="max-w-sm rounded-lg overflow-hidden shadow-lg relative">
        <a href=""></a>
        <img class="w-full h-60 object-cover" src="{{image_genre}}" alt="{{name_genre}}">
        <div class="absolute inset-0 flex items-center justify-center opacity-0 hover:opacity-100 transition duration-300 bg-black bg-opacity-50">
          <p class="text-white text-center text-lg">{{name_genre}}</p>
        </div>
      </div>
      {{endfor genre}}
    </div>

    <h3 class="text-white text-4xl text-left">Artist</h3>
    <div class=" pt-10 pb-10 grid grid-cols-1 sm:grid-cols-2 md:grid-cols-3 lg:grid-cols-4 gap-6">
      {{foreach artist}}
      <div class="max-w-sm overflow-hidden shadow-lg relative">
        <a href=""></a>
        <img class="w-full h-40 object-cover" src="{{image_artist}}" alt="Descripción de la imagen">
        <div class="absolute inset-0 flex items-center justify-center opacity-0 hover:opacity-100 transition duration-300 bg-black bg-opacity-50">
          <p class="text-white text-center text-lg">{{name_artist}}</p>
        </div>
      </div>
      {{endfor artist}}
    </div>
  </div>

    
  </div>
  {{endifnot isCLN}}
</div>