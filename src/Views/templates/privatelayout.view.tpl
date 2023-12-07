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

<body class="bg-gradient-to-r from-blue-200 to-indigo-900 bg-cover  font-sans">
  <main class="flex flex-wrap">
    <aside id="sidebar" class="bg-gray-800 w-20 text-white w-10 mb-10 fixed left-0 top-0 h-screen" >
        <div id="sidebar-content" class="flex justify-center flex-wrap items-center rounded-lg  mt-5 mb-20 " >
          <div class="mt-4 p-2 rounded-full hover:bg-pink-500 transition duration-300 ease-in-out"> <a href="index.php?page=Home_Home"> <svg width="20px" height="20px" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg" stroke="#f2f2f2"><g id="SVGRepo_bgCarrier" stroke-width="0"></g><g id="SVGRepo_tracerCarrier" stroke-linecap="round" stroke-linejoin="round"></g><g id="SVGRepo_iconCarrier"> <path d="M22 12.2039V13.725C22 17.6258 22 19.5763 20.8284 20.7881C19.6569 22 17.7712 22 14 22H10C6.22876 22 4.34315 22 3.17157 20.7881C2 19.5763 2 17.6258 2 13.725V12.2039C2 9.91549 2 8.77128 2.5192 7.82274C3.0384 6.87421 3.98695 6.28551 5.88403 5.10813L7.88403 3.86687C9.88939 2.62229 10.8921 2 12 2C13.1079 2 14.1106 2.62229 16.116 3.86687L18.116 5.10812C20.0131 6.28551 20.9616 6.87421 21.4808 7.82274" stroke="#ffffff" stroke-width="1.5" stroke-linecap="round"></path> <path d="M15 18H9" stroke="#ffffff" stroke-width="1.5" stroke-linecap="round"></path> </g></svg></div>
            {{if ~isCLS}}
          <div class="m-2 p-2 rounded-full hover:bg-pink-500 transition duration-300 ease-in-out"> <a href="index.php?page=Search_Search"> <svg width="20px" height="20px" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg"><g id="SVGRepo_bgCarrier" stroke-width="0"></g><g id="SVGRepo_tracerCarrier" stroke-linecap="round" stroke-linejoin="round"></g><g id="SVGRepo_iconCarrier"> <path d="M15.7955 15.8111L21 21M18 10.5C18 14.6421 14.6421 18 10.5 18C6.35786 18 3 14.6421 3 10.5C3 6.35786 6.35786 3 10.5 3C14.6421 3 18 6.35786 18 10.5Z" stroke="#fffafa" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"></path> </g></svg> </a>  </div>
         
<div class="m-2 p-2 rounded-full hover:bg-pink-500 transition duration-300 ease-in-out"> <a href="index.php?page=Playlists_Playlist"> <svg width="20px" height="20px" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg"><g id="SVGRepo_bgCarrier" stroke-width="0"></g><g id="SVGRepo_tracerCarrier" stroke-linecap="round" stroke-linejoin="round"></g><g id="SVGRepo_iconCarrier"> <path d="M8 6L21 6.00078M8 12L21 12.0008M8 18L21 18.0007M3 6.5H4V5.5H3V6.5ZM3 12.5H4V11.5H3V12.5ZM3 18.5H4V17.5H3V18.5Z" stroke="#ffffff" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"></path> </g></svg></a> </div>
<div class="m-2 p-2 rounded-full hover:bg-pink-500 transition duration-300 ease-in-out"> <a href="index.php?page=Favoritess_Favorites"> <svg fill="#ffffff" width="20px" height="20px" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg" stroke="#ffffff"><g id="SVGRepo_bgCarrier" stroke-width="0"></g><g id="SVGRepo_tracerCarrier" stroke-linecap="round" stroke-linejoin="round"></g><g id="SVGRepo_iconCarrier"><path d="M20.5,4.609A5.811,5.811,0,0,0,16,2.5a5.75,5.75,0,0,0-4,1.455A5.75,5.75,0,0,0,8,2.5,5.811,5.811,0,0,0,3.5,4.609c-.953,1.156-1.95,3.249-1.289,6.66,1.055,5.447,8.966,9.917,9.3,10.1a1,1,0,0,0,.974,0c.336-.187,8.247-4.657,9.3-10.1C22.45,7.858,21.453,5.765,20.5,4.609Zm-.674,6.28C19.08,14.74,13.658,18.322,12,19.34c-2.336-1.41-7.142-4.95-7.821-8.451-.513-2.646.189-4.183.869-5.007A3.819,3.819,0,0,1,8,4.5a3.493,3.493,0,0,1,3.115,1.469,1.005,1.005,0,0,0,1.76.011A3.489,3.489,0,0,1,16,4.5a3.819,3.819,0,0,1,2.959,1.382C19.637,6.706,20.339,8.243,19.826,10.889Z"></path></g></svg></a> </div>

<div class="m-2 p-2 rounded-full hover:bg-pink-500 transition duration-300 ease-in-out"> <a href="index.php?page=Songs_Song"> <svg width="20px" height="20px" viewBox="0 0 20 20" version="1.1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" fill="#ffffff" stroke="#ffffff"><g id="SVGRepo_bgCarrier" stroke-width="0"></g><g id="SVGRepo_tracerCarrier" stroke-linecap="round" stroke-linejoin="round"></g><g id="SVGRepo_iconCarrier"> <title>music [#ffffff]</title> <desc>Created with Sketch.</desc> <defs> </defs> <g id="Page-1" stroke="none" stroke-width="1" fill="none" fill-rule="evenodd"> <g id="Dribbble-Light-Preview" transform="translate(-260.000000, -3759.000000)" fill="#ffffff"> <g id="icons" transform="translate(56.000000, 160.000000)"> <path d="M224,3601.05129 L224,3610.55901 C224,3612.90979 222.17612,3614.95492 219.888035,3614.89646 C217.266519,3614.82877 215.248971,3612.1662 216.234285,3609.31593 C216.777356,3607.74464 218.297755,3606.71797 219.920978,3606.69233 C220.695653,3606.68105 220.976173,3606.88208 222.003416,3607.24105 L222.003416,3604.12822 C222.003416,3603.56207 221.556181,3603.10258 221.005124,3603.10258 L213.018786,3603.10258 C212.467729,3603.10258 212.020494,3603.56207 212.020494,3604.12822 L212.020494,3614.65851 C212.020494,3617.02057 210.179644,3619.07289 207.881575,3618.99801 C205.681339,3618.92622 203.914362,3617.02775 204.00321,3614.73031 C204.090061,3612.51594 205.989811,3610.84209 208.147121,3610.79081 C209.166377,3610.76619 209.352059,3610.92619 210.02391,3611.34363 L210.02391,3601.05129 C210.02391,3599.91795 210.91838,3599 212.020494,3599 L222.003416,3599 C223.106529,3599 224,3599.91795 224,3601.05129" id="music-[#ffffff]"> </path> </g> </g> </g> </g></svg> </div>

  <div class="m-2 p-2 rounded-full hover:bg-pink-500 transition duration-300 ease-in-out"> <a href="index.php?page=Videos_Video"> <svg width="20px" height="20px" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg"><g id="SVGRepo_bgCarrier" stroke-width="0"></g><g id="SVGRepo_tracerCarrier" stroke-linecap="round" stroke-linejoin="round"></g><g id="SVGRepo_iconCarrier"> <path d="M16 10L18.5768 8.45392C19.3699 7.97803 19.7665 7.74009 20.0928 7.77051C20.3773 7.79703 20.6369 7.944 20.806 8.17433C21 8.43848 21 8.90095 21 9.8259V14.1741C21 15.099 21 15.5615 20.806 15.8257C20.6369 16.056 20.3773 16.203 20.0928 16.2295C19.7665 16.2599 19.3699 16.022 18.5768 15.5461L16 14M6.2 18H12.8C13.9201 18 14.4802 18 14.908 17.782C15.2843 17.5903 15.5903 17.2843 15.782 16.908C16 16.4802 16 15.9201 16 14.8V9.2C16 8.0799 16 7.51984 15.782 7.09202C15.5903 6.71569 15.2843 6.40973 14.908 6.21799C14.4802 6 13.9201 6 12.8 6H6.2C5.0799 6 4.51984 6 4.09202 6.21799C3.71569 6.40973 3.40973 6.71569 3.21799 7.09202C3 7.51984 3 8.07989 3 9.2V14.8C3 15.9201 3 16.4802 3.21799 16.908C3.40973 17.2843 3.71569 17.5903 4.09202 17.782C4.51984 18 5.07989 18 6.2 18Z" stroke="#ffffff" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"></path> </g></svg></div>

    <div class="m-2 p-2 rounded-full hover:bg-pink-500 transition duration-300 ease-in-out"> <a href="index.php?page=Artists_Artist"> <svg height="20px" width="20px" version="1.1" id="_x32_" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" viewBox="0 0 512 512" xml:space="preserve" fill="#ffffff"><g id="SVGRepo_bgCarrier" stroke-width="0"></g><g id="SVGRepo_tracerCarrier" stroke-linecap="round" stroke-linejoin="round"></g><g id="SVGRepo_iconCarrier"> <style type="text/css"> .st0{fill:#ffffff;} </style> <g> <path class="st0" d="M436.099,405.199c-13.076-18.419-32.744-28.504-51.117-35.111c-9.225-3.303-18.191-5.724-26.038-7.778 c-7.824-2.055-14.576-3.791-18.929-5.442l-0.008,0.008c-1.035-0.388-2.086-0.852-3.128-1.263c0-8.494,0-15.412,0-18.252 c-0.053-5.556-0.274-10.694-2.717-15.801c-1.233-2.512-3.288-5-6.059-6.607c-2.747-1.621-5.921-2.284-9.042-2.268 c-1.058,0-1.781,0-2.961,0c0-1.553,0-3.258,0-4.932c9.803-10.641,26.335-27.568,32.485-54.862c2.04-0.913,4.064-1.948,6.012-3.318 c4.818-3.319,8.898-8.136,12.353-14.697c3.494-6.584,6.577-15.002,9.864-26.525c1.667-5.846,2.444-10.922,2.444-15.436 c0.008-5.213-1.066-9.727-3.037-13.396c-2.306-4.369-5.746-7.178-8.989-8.874l-0.684-22.955 c16.95-3.372,27.766-12.141,29.721-30.872c4.636-44.48-46.17-86.738-115.618-98.268c0.266-0.876,0.468-1.804,0.563-2.748 c0.822-7.901-4.688-14.933-12.318-15.725c-7.623-0.807-14.469,4.948-15.292,12.832c-0.102,0.959-0.106,1.903-0.026,2.816 c-70.332-3.067-128.767,27.796-133.41,72.277c-2.089,19.995,7.943,31.023,25.932,37.721l-1.324,45.013 c-0.491,0.251-0.952,0.396-1.454,0.708c-2.774,1.712-5.583,4.392-7.538,8.061c-1.972,3.684-3.045,8.19-3.038,13.395 c0,4.529,0.776,9.606,2.44,15.436c4.407,15.359,8.384,25.254,13.533,32.53c2.572,3.608,5.499,6.508,8.684,8.708 c1.952,1.37,3.98,2.405,6.024,3.318c6.138,27.294,22.682,44.221,32.481,54.862c0,1.674,0,3.379,0,4.932c-1.183,0-1.902,0-2.965,0 c-3.121-0.016-6.286,0.647-9.042,2.268c-2.059,1.202-3.768,2.907-4.974,4.75c-1.827,2.77-2.676,5.708-3.178,8.608 c-0.491,2.93-0.624,5.914-0.628,9.05c0,2.846,0,9.788,0,18.282c-0.997,0.38-2.044,0.853-2.995,1.187 c-5.951,2.116-15.983,4.339-27.313,7.452c-17.034,4.719-37.363,11.501-53.986,24.942c-8.3,6.743-15.63,15.2-20.813,25.787 c-5.191,10.565-8.182,23.184-8.171,37.904c0,3.204,0.137,6.5,0.422,9.91c0.225,2.527,1.192,4.597,2.314,6.294 c2.165,3.158,5.02,5.518,8.605,7.931c6.268,4.148,14.956,8.197,26.084,12.185c33.292,11.881,88.424,22.75,156.735,22.765 c55.501,0,102.348-7.208,135.784-16.25c16.737-4.544,30.088-9.514,39.739-14.462c4.833-2.504,8.738-4.97,11.843-7.672 c1.552-1.37,2.907-2.801,4.057-4.498c1.126-1.698,2.093-3.768,2.322-6.294c0.281-3.403,0.411-6.698,0.411-9.88 C450.195,433.307,444.799,417.446,436.099,405.199z M177.275,246.094l-0.762-4.323l-4.129-1.469 c-2.622-0.929-4.627-1.888-6.367-3.106c-2.584-1.819-4.92-4.3-7.649-9.392c-2.694-5.054-5.556-12.62-8.681-23.603 c-1.369-4.803-1.864-8.532-1.86-11.303c0.004-3.212,0.62-5.084,1.252-6.271c0.948-1.736,2.112-2.459,3.592-3.06 c1.241-0.472,2.532-0.586,3.003-0.594l4.27,0.449l5.232,11.698c0,0,1.305-30.84,20.52-61.118c20.15,2.428,43.616,3.897,68.547,6.5 c30.007,3.135,57.548,7.398,80.314,8.616c11.363,24.63,12.269,46.002,12.269,46.002l4.97-11.097l4.833-1.051 c0.898,0.076,2.77,0.396,4.079,1.264c0.868,0.563,1.568,1.202,2.215,2.39c0.624,1.187,1.24,3.059,1.255,6.286 c0,2.771-0.494,6.5-1.864,11.287c-4.156,14.652-7.885,23.169-11.303,27.895c-1.705,2.39-3.28,3.882-5.031,5.1 c-1.736,1.218-3.737,2.177-6.363,3.106l-4.133,1.469l-0.761,4.323c-4.704,26.556-21.045,41.824-31.769,53.675l-1.942,2.154v2.892 c0,3.882,0,7.322,0,10.61h-90.025c0-3.288,0-6.728,0-10.61v-2.892l-1.938-2.154C198.324,287.918,181.987,272.65,177.275,246.094z M434.745,460.883l-0.655,0.776c-1.119,1.127-3.357,2.809-6.516,4.612c-11.113,6.417-33.056,14.302-62.511,20.292 c-29.494,6.036-66.674,10.359-109.061,10.359c-54.173,0-99.868-7.078-131.843-15.725c-15.968-4.331-28.53-9.073-36.773-13.32 c-4.11-2.108-7.132-4.118-8.802-5.602c-0.712-0.616-1.116-1.08-1.317-1.369c-0.217-2.756-0.346-5.435-0.346-7.992 c0.03-16.974,4.437-29.35,11.284-39.122c10.236-14.614,26.792-23.655,43.825-29.737c8.49-3.052,17.019-5.351,24.766-7.36 c7.764-2.009,14.686-3.668,20.346-5.647c2.736-0.96,5.617-2.086,8.536-3.365l4.525-1.979v-4.932c0-10.793,0-20.01,0-23.412 c-0.061-4.72,0.578-8.152,1.13-9.05l0.221-0.358l0.172-0.061c0.19-0.054,0.578-0.129,1.217-0.129c2.31,0,2.912,0,10.504,0h0.841 h6.702h90.025h2.405h5.138c7.596,0,8.198,0,10.504,0l1.149,0.106l0.236,0.084l0.221,0.35c0.548,0.868,1.202,4.308,1.142,9.058 c0,3.394,0,12.574,0,23.321v4.916l4.499,1.98c2.824,1.248,5.662,2.39,8.418,3.417l2.649-7.055l-2.649,7.063 c7.55,2.786,17.422,4.978,28.367,8.038c16.372,4.52,34.784,10.914,48.552,22.072c6.903,5.571,12.673,12.254,16.798,20.611 c4.11,8.372,6.629,18.488,6.644,31.222C435.087,455.472,434.95,458.136,434.745,460.883z"></path> <path class="st0" d="M246.469,199.582h19.058c2.908,15.588,16.528,27.408,32.968,27.423c18.548-0.015,33.581-15.047,33.588-33.588 c-0.008-18.556-15.04-33.589-33.588-33.596c-16.441,0.008-30.06,11.828-32.968,27.416h-19.058 c-2.903-15.588-16.528-27.408-32.964-27.416c-18.552,0.008-33.585,15.04-33.588,33.596c0.003,18.541,15.036,33.573,33.588,33.588 C229.941,226.99,243.566,215.17,246.469,199.582z M298.496,172.166c11.729,0.015,21.22,9.514,21.251,21.251 c-0.03,11.721-9.522,21.22-21.251,21.242c-11.733-0.023-21.232-9.521-21.251-21.242 C277.264,181.68,286.763,172.181,298.496,172.166z M192.255,193.417c0.022-11.737,9.518-21.236,21.25-21.251 c11.733,0.015,21.228,9.514,21.251,21.251c-0.022,11.721-9.518,21.22-21.251,21.242 C201.772,214.636,192.277,205.138,192.255,193.417z"></path> </g> </g></svg></div>

  <div class="m-2 p-2 rounded-full hover:bg-pink-500 transition duration-300 ease-in-out"> <a href="index.php?page=Albums_Album"> <svg fill="#ffffff" height="20px" width="20px" version="1.1" id="Layer_1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" viewBox="0 0 512 512" xml:space="preserve" stroke="#ffffff"><g id="SVGRepo_bgCarrier" stroke-width="0"></g><g id="SVGRepo_tracerCarrier" stroke-linecap="round" stroke-linejoin="round"></g><g id="SVGRepo_iconCarrier"> <g> <g> <g> <path d="M490.667,21.333h-384H21.333C9.551,21.333,0,30.885,0,42.667v426.667c0,11.782,9.551,21.333,21.333,21.333h85.333h384 c11.782,0,21.333-9.551,21.333-21.333V42.667C512,30.885,502.449,21.333,490.667,21.333z M42.667,64h42.667v384H42.667V64z M469.333,448H128V64h341.333V448z"></path> <path d="M256,426.667c35.035,0,64-28.965,64-64V320V155.175l29.222,26.8c12.809,15.21,16.819,36.03,10.515,54.957l-6.598,20.762 c-3.568,11.229,2.643,23.224,13.872,26.792c11.229,3.568,23.224-2.643,26.792-13.872l6.507-20.48 c11.11-33.349,3.654-70.402-19.679-97.072l-1.637-1.675l-65.899-60.437c-0.144-0.132-0.301-0.243-0.448-0.371 c-0.268-0.233-0.541-0.46-0.821-0.68c-0.278-0.218-0.558-0.429-0.844-0.631c-0.282-0.2-0.57-0.391-0.862-0.578 c-0.299-0.191-0.6-0.376-0.906-0.55c-0.299-0.171-0.604-0.331-0.912-0.487c-0.309-0.157-0.619-0.309-0.934-0.45 c-0.325-0.145-0.655-0.278-0.987-0.407c-0.31-0.12-0.619-0.237-0.933-0.341c-0.35-0.117-0.705-0.221-1.063-0.321 c-0.309-0.086-0.618-0.168-0.93-0.239c-0.366-0.084-0.735-0.155-1.108-0.22c-0.318-0.055-0.635-0.105-0.955-0.146 c-0.369-0.047-0.74-0.084-1.114-0.112c-0.332-0.025-0.664-0.041-0.996-0.05c-0.206-0.006-0.408-0.031-0.616-0.031 c-0.174,0-0.342,0.022-0.514,0.026c-0.313,0.008-0.625,0.026-0.938,0.047c-0.407,0.028-0.812,0.06-1.212,0.111 c-0.26,0.033-0.517,0.076-0.776,0.118c-0.442,0.072-0.88,0.149-1.312,0.248c-0.219,0.05-0.436,0.111-0.654,0.168 c-0.456,0.119-0.908,0.244-1.351,0.392c-0.206,0.069-0.408,0.149-0.611,0.224c-0.442,0.163-0.881,0.331-1.309,0.522 c-0.209,0.093-0.413,0.198-0.62,0.299c-0.413,0.201-0.823,0.406-1.221,0.632c-0.209,0.119-0.412,0.249-0.617,0.375 c-0.389,0.239-0.773,0.483-1.145,0.745c-0.192,0.135-0.378,0.281-0.566,0.423c-0.379,0.287-0.751,0.581-1.11,0.892 c-0.162,0.141-0.319,0.287-0.477,0.434c-0.375,0.345-0.738,0.7-1.087,1.071c-0.063,0.066-0.131,0.123-0.193,0.191 c-0.074,0.081-0.135,0.169-0.207,0.25c-0.343,0.385-0.672,0.781-0.986,1.191c-0.125,0.163-0.248,0.327-0.368,0.493 c-0.29,0.4-0.564,0.811-0.826,1.232c-0.114,0.183-0.227,0.365-0.335,0.551c-0.242,0.416-0.467,0.842-0.681,1.275 c-0.096,0.194-0.192,0.388-0.281,0.584c-0.199,0.435-0.379,0.879-0.549,1.33c-0.075,0.2-0.151,0.399-0.22,0.601 c-0.154,0.45-0.29,0.908-0.414,1.371c-0.056,0.21-0.112,0.42-0.162,0.631c-0.107,0.452-0.196,0.91-0.273,1.373 c-0.039,0.233-0.076,0.466-0.107,0.701c-0.059,0.44-0.102,0.884-0.134,1.332c-0.018,0.264-0.031,0.526-0.04,0.79 c-0.008,0.238-0.036,0.47-0.036,0.71v192H256c-35.009,0-64,30.096-64,65.195C192,398.864,220.915,426.667,256,426.667z M256,341.333h21.333v21.333c0,11.471-9.862,21.333-21.333,21.333c-11.887,0-21.333-9.083-21.333-20.139 C234.667,351.977,244.92,341.333,256,341.333z"></path> </g> </g> </g> </g></svg></div>
{{endif ~isCLS}}

{{ifnot ~isADMIN}}
<div class="m-2 p-2 rounded-full hover:bg-pink-500 transition duration-300 ease-in-out"> <a href="index.php?page=Store_Store"> <svg width="20px" height="20px" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg" stroke="#f2f2f2"><g id="SVGRepo_bgCarrier" stroke-width="0"></g><g id="SVGRepo_tracerCarrier" stroke-linecap="round" stroke-linejoin="round"></g><g id="SVGRepo_iconCarrier"> <path d="M21 22H11M3 22H7" stroke="#ffffff" stroke-width="1.5" stroke-linecap="round"></path> <path d="M19 22V15" stroke="##ffffff" stroke-width="1.5" stroke-linecap="round"></path> <path d="M5 22V15" stroke="##ffffff" stroke-width="1.5" stroke-linecap="round"></path> <path d="M11.9999 2H7.47214C6.26932 2 5.66791 2 5.18461 2.2987C4.7013 2.5974 4.43234 3.13531 3.89443 4.21114L2.49081 7.75929C2.16652 8.57905 1.88279 9.54525 2.42867 10.2375C2.79489 10.7019 3.36257 11 3.99991 11C5.10448 11 5.99991 10.1046 5.99991 9C5.99991 10.1046 6.89534 11 7.99991 11C9.10448 11 9.99991 10.1046 9.99991 9C9.99991 10.1046 10.8953 11 11.9999 11C13.1045 11 13.9999 10.1046 13.9999 9C13.9999 10.1046 14.8953 11 15.9999 11C17.1045 11 17.9999 10.1046 17.9999 9C17.9999 10.1046 18.8953 11 19.9999 11C20.6373 11 21.205 10.7019 21.5712 10.2375C22.1171 9.54525 21.8334 8.57905 21.5091 7.75929L20.1055 4.21114C19.5676 3.13531 19.2986 2.5974 18.8153 2.2987C18.332 2 17.7306 2 16.5278 2H16" stroke="#ffffff" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"></path> </g></svg></a> </div>

<div class="m-2 p-2 rounded-full hover:bg-pink-500 transition duration-300 ease-in-out"><a href="index.php?page=Store_ShoppingCart"> <svg width="20px" height="20px" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg" stroke="#fafafa"><g id="SVGRepo_bgCarrier" stroke-width="0"></g><g id="SVGRepo_tracerCarrier" stroke-linecap="round" stroke-linejoin="round"></g><g id="SVGRepo_iconCarrier"> <path d="M19.5 9.5L18.7896 6.89465C18.5157 5.89005 18.3787 5.38775 18.0978 5.00946C17.818 4.63273 17.4378 4.34234 17.0008 4.17152C16.5619 4 16.0413 4 15 4M4.5 9.5L5.2104 6.89465C5.48432 5.89005 5.62128 5.38775 5.90221 5.00946C6.18199 4.63273 6.56216 4.34234 6.99922 4.17152C7.43808 4 7.95872 4 9 4" stroke="#1#ffffff" stroke-width="1.5"></path> <path d="M9 4C9 3.44772 9.44772 3 10 3H14C14.5523 3 15 3.44772 15 4C15 4.55228 14.5523 5 14 5H10C9.44772 5 9 4.55228 9 4Z" stroke="##ffffff" stroke-width="1.5"></path> <path d="M8 13V17" stroke="##ffffff" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"></path> <path d="M16 13V17" stroke="##ffffff" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"></path> <path d="M12 13V17" stroke="##ffffff" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"></path> <path d="M3.864 16.4552C4.40967 18.6379 4.68251 19.7292 5.49629 20.3646C6.31008 21 7.435 21 9.68486 21H14.3155C16.5654 21 17.6903 21 18.5041 20.3646C19.3179 19.7292 19.5907 18.6379 20.1364 16.4552C20.9943 13.0234 21.4233 11.3075 20.5225 10.1538C19.6217 9 17.853 9 14.3155 9H9.68486C6.14745 9 4.37875 9 3.47791 10.1538C2.94912 10.831 2.87855 11.702 3.08398 13" stroke="##ffffff" stroke-width="1.5" stroke-linecap="round"></path> </g></svg></a> </div>

<div class="m-2 p-2 rounded-full hover:bg-pink-500 transition duration-300 ease-in-out"> <a href="index.php?page=Purchases_Purchase"> <svg fill="#ffffff" width="20px" height="20px" viewBox="0 0 16 16" xmlns="http://www.w3.org/2000/svg" stroke="#ffffff"><g id="SVGRepo_bgCarrier" stroke-width="0"></g><g id="SVGRepo_tracerCarrier" stroke-linecap="round" stroke-linejoin="round"></g><g id="SVGRepo_iconCarrier"><path d="M5.44 7.47h5.26v1.25H5.44zm0 2.36h5.26v1.25H5.44zm0-4.76h5.26v1.25H5.44z"></path><path d="M11.34 1 9.64.28 8.08 1 6.41.28 4.84 1 2.46 0v16l2.38-1 1.57.69L8.08 15l1.56.69 1.7-.69 2.2 1V0zm.94 13.11-.92-.41-1.69.69-1.57-.72-1.68.69-1.55-.69-1.15.47V1.86l1.15.47 1.55-.69 1.68.69 1.57-.69 1.69.69.92-.41z"></path></g></svg></a> </div>
{{endifnot ~isADMIN}}
{{if ~isADMIN}}
<div class="m-2 p-2 rounded-full hover:bg-pink-500 transition duration-300 ease-in-out"> <a href="index.php?page=Admin_Dashboard"> <svg fill="#ffffff" width="20px" height="20px" viewBox="0 0 1920 1920" xmlns="http://www.w3.org/2000/svg" stroke="#ffffff"><g id="SVGRepo_bgCarrier" stroke-width="0"></g><g id="SVGRepo_tracerCarrier" stroke-linecap="round" stroke-linejoin="round"></g><g id="SVGRepo_iconCarrier"> <path d="M276.941 440.584v565.722c0 422.4 374.174 625.468 674.71 788.668l8.02 4.292 8.131-4.292c300.537-163.2 674.71-366.268 674.71-788.668V440.584l-682.84-321.657L276.94 440.584Zm682.73 1479.529c-9.262 0-18.523-2.372-26.993-6.89l-34.9-18.974C588.095 1726.08 164 1495.906 164 1006.306V404.78c0-21.91 12.65-41.788 32.414-51.162L935.727 5.42c15.134-7.228 32.866-7.228 48 0l739.313 348.2c19.765 9.374 32.414 29.252 32.414 51.162v601.525c0 489.6-424.207 719.774-733.779 887.943l-34.899 18.975c-8.47 4.517-17.731 6.889-27.105 6.889Zm467.158-547.652h-313.412l-91.595-91.482v-83.803H905.041v-116.78h-83.69l-58.503-58.504c-1.92.113-3.84.113-5.76.113-176.075 0-319.285-143.21-319.285-319.285 0-176.075 143.21-319.398 319.285-319.398 176.075 0 319.285 143.323 319.285 319.398 0 1.92 0 3.84-.113 5.647l350.57 350.682v313.412Zm-266.654-112.941h153.713v-153.713L958.462 750.155l3.953-37.27c1.017-123.897-91.595-216.621-205.327-216.621S550.744 588.988 550.744 702.72c0 113.845 92.612 206.344 206.344 206.344l47.21-5.309 63.811 63.7h149.873v116.78h116.781v149.986l25.412 25.299Zm-313.4-553.57c0 46.758-37.949 84.706-84.706 84.706-46.758 0-84.706-37.948-84.706-84.706s37.948-84.706 84.706-84.706c46.757 0 84.706 37.948 84.706 84.706" fill-rule="evenodd"></path> </g></svg></a> </div>

<div class="m-2 p-2 rounded-full hover:bg-pink-500 transition duration-300 ease-in-out"> <a href="index.php?page=Escupitajo_GenerarCrud"> <svg width="20px" height="20px" viewBox="0 0 64 64" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" aria-hidden="true" role="img" class="iconify iconify--emojione-monotone" preserveAspectRatio="xMidYMid meet" fill="#ffffff" stroke="#ffffff"><g id="SVGRepo_bgCarrier" stroke-width="0"></g><g id="SVGRepo_tracerCarrier" stroke-linecap="round" stroke-linejoin="round"></g><g id="SVGRepo_iconCarrier"><path d="M62 9s-14.282 3.232-30 3.232C16.283 12.232 2 9 2 9c0 4.567 2.309 8.851 6.176 12.311c-.174 1.856-.175 4.355-.175 7.7C8.001 46.313 18.746 55 32 55c13.256 0 24.001-8.687 24.001-25.99c0-3.346 0-5.846-.173-7.702C59.693 17.849 62 13.566 62 9M32 52.546c-10.433 0-21.58-6.183-21.58-23.536c0-4.693 0-8.084.549-9.505c.158-.412.309-.8 2.742-.8c1.26 0 2.857.108 4.879.246c2.988.203 7.004.472 12.078.514L32 46.683l1.332-27.218c5.076-.042 9.095-.311 12.083-.514c2.022-.137 3.62-.246 4.88-.246c2.433 0 2.581.387 2.74.798c.546 1.417.546 4.631.546 9.507c0 17.353-11.147 23.536-21.581 23.536" fill="#ffffff"></path></g></svg></a> </div>
{{endif ~isADMIN}}
        </div>
   
      
    </aside>
    <section class="w-full h-screen md:w-2/3 flex-1 min-w-0 mb-10 mt-4 mr-4 ml-20">
      <header class="bg-gray-800 mx-4 rounded-lg mb-4 text-white py-4 flex items-center justify-around">
        <nav id="menu" class="hidden px-auto md:block">
          <ul class="flex items-center space-x-4">
            {{foreach NAVIGATION}}
              <li><a href="{{nav_url}}" class="hover:text-gray-300">{{nav_label}}</a></li>
            {{endfor NAVIGATION}}
         
          </ul>
        </nav>
        {{with login}}
        <div class="flex items-center space-around">
          <span class="text-lg mr-2">{{userName}}</span>
          
          </a>
      </div>
      <div x-data="{ showModal: false }">
        <button @click="showModal = true" class="bg-blue-500 hover:bg-blue-700 text-white font-bold py-2 px-4 rounded">
            <svg width="20px" height="20px" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg"><g id="SVGRepo_bgCarrier" stroke-width="0"></g><g id="SVGRepo_tracerCarrier" stroke-linecap="round" stroke-linejoin="round"></g><g id="SVGRepo_iconCarrier"> <circle cx="12" cy="6" r="4" stroke="#ffffff" stroke-width="1.5"></circle> <path d="M19.9975 18C20 17.8358 20 17.669 20 17.5C20 15.0147 16.4183 13 12 13C7.58172 13 4 15.0147 4 17.5C4 19.9853 4 22 12 22C14.231 22 15.8398 21.8433 17 21.5634" stroke="#ffffff" stroke-width="1.5" stroke-linecap="round"></path> </g></svg>
        </button>
      
        <div x-show="showModal" class="fixed z-10 inset-0 overflow-y-auto" style="display: none;">
          <div class="flex items-center justify-center min-h-screen pt-4 px-4 pb-20 text-center sm:block sm:p-0">
            <div x-show="showModal" class="fixed inset-0 transition-opacity" x-transition:enter="ease-out duration-300" x-transition:enter-start="opacity-0" x-transition:enter-end="opacity-100" x-transition:leave="ease-in duration-200" x-transition:leave-start="opacity-100" x-transition:leave-end="opacity-0" style="display: none;">
              <div class="absolute inset-0 bg-black opacity-75"></div>
            </div>

            <span class="hidden sm:inline-block sm:align-middle sm:h-screen" aria-hidden="true">&#8203;</span>
            <div x-show="showModal" class="inline-block align-bottom bg-white rounded-lg text-left overflow-hidden shadow-xl transform transition-all sm:my-8 sm:align-middle sm:max-w-lg sm:w-full" x-transition:enter="ease-out duration-300" x-transition:enter-start="opacity-0 translate-y-4 sm:translate-y-0 sm:scale-95" x-transition:enter-end="opacity-100 translate-y-0 sm:scale-100" x-transition:leave="ease-in duration-200" x-transition:leave-start="opacity-100 translate-y-0 sm:scale-100" x-transition:leave-end="opacity-0 translate-y-4 sm:translate-y-0 sm:scale-95" style="display: none;">
              <div class="bg-white px-4 pt-5 pb-4 sm:p-6 sm:pb-4">
                <div class="sm:flex sm:items-start">
                  <div class="mt-3 text-center sm:mt-0 sm:ml-4 sm:text-left">
                    <h3 class="text-lg font-medium leading-6 text-gray-900" id="modal-title">
                     Personal Details
                    </h3>
  
                    <div class="mt-2">

                      <p class="text-sm text-gray-500 pt-2">Name {{userName}}</p>
                      <p class="text-sm text-gray-500 pb-2">Email {{userEmail}}</p>
                      
                    </div>
                  </div>
                </div>
              </div>
              <div class="bg-gray-50 px-4 py-3 sm:px-6 sm:flex sm:flex-row-reverse">
                <button @click="showModal = false" type="button" class="text-xl text-blue-500 mx-2 hover:text-gray-300">
                  Close
                </button>
                <a href="index.php?page=sec_logout" class="text-xl mx-2 text-red-500 hover:text-gray-300">Logout</a>
              </div>
            </div>
          </div>
        </div>
      </div>
      
        {{endwith login}}
      </header>
      <div class="container align-center justify-center">
        <div class="mt-16 mb-16">
          {{{page_content}}}
          
        </div>
    

    </div>
    
    
    </section>
   
</main>

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
