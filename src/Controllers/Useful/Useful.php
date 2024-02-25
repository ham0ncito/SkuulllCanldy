-- Active: 1698162320673@@127.0.0.1@3306@skull2canldydb
<?php
/**

 * PHP version 8.2.4
 *
 * @Date 22/08/23
 * @Last Update 20/2/24
 * Updated by Skuul2candly
 * Issue Number : 23
 * Ticket Number : 23
 * Changes Approved on 20/2/24
 * Tested by Skullcanldy
 * Description: 
	This is the first documentation commit
 * Disclosure Agreement: 
	Keep this information in secret
 * Last changes done: 
	Documentation Added
	
 * @author     SkullCanldy
 * @link       https://www.php.net/docs.php
 */
namespace Controllers\Useful;
use Controllers\PublicController;
use Views\Renderer;
use Utilities\Site;
use Utilities\Validators;
use Utilities\Context;
use Utilities\Paging;
class Useful extends PublicController {
 

    public function run(): void
    {
        $viewData= array();
        $viewData = [
            "class"=> "useful",
            "name"=> "Useful Links",
            "title"=> "Constantly Willing To Be Useful",
            "text"=> [
                [
                    "description"=> "Check down our useful links"
                ],
               
            ],
            "div"=> [
                [
                    "code"=> '<div class=" flex flex-wrap overflow-hidden justify-center items-center">
                    <div class="relative mt-6 flex w-96 flex-col rounded-xl bg-white bg-clip-border text-gray-700 shadow-md">
  <div class="p-6">
  <svg width="69px" height="69px" viewBox="0 0 24 24" role="img" xmlns="http://www.w3.org/2000/svg" aria-labelledby="supportIconTitle" stroke="#273bd3" stroke-width="1" stroke-linecap="square" stroke-linejoin="miter" fill="none" color="#000000"><g id="SVGRepo_bgCarrier" stroke-width="0"></g><g id="SVGRepo_tracerCarrier" stroke-linecap="round" stroke-linejoin="round"></g><g id="SVGRepo_iconCarrier"> <title id="supportIconTitle">Support</title> <path d="M18,9 L16,9 C14.8954305,9 14,9.8954305 14,11 L14,13 C14,14.1045695 14.8954305,15 16,15 L16,15 C17.1045695,15 18,14.1045695 18,13 L18,9 C18,4.02943725 13.9705627,0 9,0 C4.02943725,0 0,4.02943725 0,9 L0,13 C1.3527075e-16,14.1045695 0.8954305,15 2,15 L2,15 C3.1045695,15 4,14.1045695 4,13 L4,11 C4,9.8954305 3.1045695,9 2,9 L0,9" transform="translate(3 3)"></path> <path d="M21,14 L21,18 C21,20 20.3333333,21 19,21 C17.6666667,21 16,21 14,21"></path> </g></svg>
 
    <h5 class="mb-2 block font-sans text-xl font-semibold leading-snug tracking-normal text-blue-gray-900 antialiased">
      Support
    </h5>
    <p class="block font-sans text-base font-light leading-relaxed text-inherit antialiased">
      Because we strive for the best. Our support team is always ready to assist you.
    </p>
  </div>
  <div class="p-6 pt-0">
    <a
      class="!font-medium !text-blue-gray-900 !transition-colors hover:!text-pink-500"
      href="index.php?page=Useful_Support"
    >
      <button
        class="flex select-none items-center gap-2 rounded-lg py-2 px-4 text-center align-middle font-sans text-xs font-bold uppercase text-pink-500 transition-all hover:bg-pink-500/10 active:bg-pink-500/30 disabled:pointer-events-none disabled:opacity-50 disabled:shadow-none"
        type="button"
        data-ripple-dark="true"
      >
        Learn More
        <svg
          xmlns="http://www.w3.org/2000/svg"
          fill="none"
          viewBox="0 0 24 24"
          stroke-width="2"
          stroke="currentColor"
          aria-hidden="true"
          class="h-4 w-4"
        >
          <path
            stroke-linecap="round"
            stroke-linejoin="round"
            d="M17.25 8.25L21 12m0 0l-3.75 3.75M21 12H3"
          ></path>
        </svg>
      </button>
    </a>
  </div>
</div>
                    



<div class="relative mt-6  mx-4 flex w-96 flex-col rounded-xl bg-white bg-clip-border text-gray-700 shadow-md">
  <div class="p-6">
  <svg fill="#b76ad2" width="68px" height="68px" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg" stroke="#b76ad2"><g id="SVGRepo_bgCarrier" stroke-width="0"></g><g id="SVGRepo_tracerCarrier" stroke-linecap="round" stroke-linejoin="round"></g><g id="SVGRepo_iconCarrier"> <path fill-rule="evenodd" d="M12,23 C5.92486775,23 1,18.0751322 1,12 C1,5.92486775 5.92486775,1 12,1 C18.0751322,1 23,5.92486775 23,12 C23,18.0751322 18.0751322,23 12,23 Z M12,21 C16.9705627,21 21,16.9705627 21,12 C21,7.02943725 16.9705627,3 12,3 C7.02943725,3 3,7.02943725 3,12 C3,16.9705627 7.02943725,21 12,21 Z M8,17 L8,7 C8,6.21456446 8.86395093,5.73572169 9.52999894,6.1520017 L17.5299989,11.1520017 C18.156667,11.5436692 18.156667,12.4563308 17.5299989,12.8479983 L9.52999894,17.8479983 C8.86395093,18.2642783 8,17.7854355 8,17 Z M15.1132038,12 L10,8.80424764 L10,15.1957524 L15.1132038,12 Z"></path> </g></svg>
    <h5 class="mb-2 block font-sans text-xl font-semibold leading-snug tracking-normal text-blue-gray-900 antialiased">
     Player
    </h5>
    <p class="block font-sans text-base font-light leading-relaxed text-inherit antialiased">
      Listen to your music wherever, whenever, without interruptions
    </p>
  </div>
  <div class="p-6 pt-0">
    <a
      class="!font-medium !text-blue-gray-900 !transition-colors hover:!text-pink-500"
      href="index.php?page=Useful_WebPlayer"
    >
      <button
        class="flex select-none items-center gap-2 rounded-lg py-2 px-4 text-center align-middle font-sans text-xs font-bold uppercase text-pink-500 transition-all hover:bg-pink-500/10 active:bg-pink-500/30 disabled:pointer-events-none disabled:opacity-50 disabled:shadow-none"
        type="button"
        data-ripple-dark="true"
      >
        Learn More
        <svg
          xmlns="http://www.w3.org/2000/svg"
          fill="none"
          viewBox="0 0 24 24"
          stroke-width="2"
          stroke="currentColor"
          aria-hidden="true"
          class="h-4 w-4"
        >
          <path
            stroke-linecap="round"
            stroke-linejoin="round"
            d="M17.25 8.25L21 12m0 0l-3.75 3.75M21 12H3"
          ></path>
        </svg>
      </button>
    </a>
  </div>
</div>

<div class="relative mt-6  mx-4 flex w-96 flex-col rounded-xl bg-white bg-clip-border text-gray-700 shadow-md">
  <div class="p-6">
  <svg width="66px" height="66px" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg" stroke="#4d7ff5"><g id="SVGRepo_bgCarrier" stroke-width="0"></g><g id="SVGRepo_tracerCarrier" stroke-linecap="round" stroke-linejoin="round"></g><g id="SVGRepo_iconCarrier"> <path d="M5.625 15C5.625 14.5858 5.28921 14.25 4.875 14.25C4.46079 14.25 4.125 14.5858 4.125 15H5.625ZM4.875 16H4.125H4.875ZM19.275 15C19.275 14.5858 18.9392 14.25 18.525 14.25C18.1108 14.25 17.775 14.5858 17.775 15H19.275ZM11.1086 15.5387C10.8539 15.8653 10.9121 16.3366 11.2387 16.5914C11.5653 16.8461 12.0366 16.7879 12.2914 16.4613L11.1086 15.5387ZM16.1914 11.4613C16.4461 11.1347 16.3879 10.6634 16.0613 10.4086C15.7347 10.1539 15.2634 10.2121 15.0086 10.5387L16.1914 11.4613ZM11.1086 16.4613C11.3634 16.7879 11.8347 16.8461 12.1613 16.5914C12.4879 16.3366 12.5461 15.8653 12.2914 15.5387L11.1086 16.4613ZM8.39138 10.5387C8.13662 10.2121 7.66533 10.1539 7.33873 10.4086C7.01212 10.6634 6.95387 11.1347 7.20862 11.4613L8.39138 10.5387ZM10.95 16C10.95 16.4142 11.2858 16.75 11.7 16.75C12.1142 16.75 12.45 16.4142 12.45 16H10.95ZM12.45 5C12.45 4.58579 12.1142 4.25 11.7 4.25C11.2858 4.25 10.95 4.58579 10.95 5H12.45ZM4.125 15V16H5.625V15H4.125ZM4.125 16C4.125 18.0531 5.75257 19.75 7.8 19.75V18.25C6.61657 18.25 5.625 17.2607 5.625 16H4.125ZM7.8 19.75H15.6V18.25H7.8V19.75ZM15.6 19.75C17.6474 19.75 19.275 18.0531 19.275 16H17.775C17.775 17.2607 16.7834 18.25 15.6 18.25V19.75ZM19.275 16V15H17.775V16H19.275ZM12.2914 16.4613L16.1914 11.4613L15.0086 10.5387L11.1086 15.5387L12.2914 16.4613ZM12.2914 15.5387L8.39138 10.5387L7.20862 11.4613L11.1086 16.4613L12.2914 15.5387ZM12.45 16V5H10.95V16H12.45Z" fill="#4d7ff5"></path> </g></svg>
    <h5 class="mb-2 block font-sans text-xl font-semibold leading-snug tracking-normal text-blue-gray-900 antialiased">
     Download App
    </h5>
    <p class="block font-sans text-base font-light leading-relaxed text-inherit antialiased">
      Download the very best experience of entertainment 
    </p>
  </div>
  <div class="p-6 pt-0">
    <a
      class="!font-medium !text-blue-gray-900 !transition-colors hover:!text-pink-500"
      href="index.php?page=Useful_App"
    >
      <button
        class="flex select-none items-center gap-2 rounded-lg py-2 px-4 text-center align-middle font-sans text-xs font-bold uppercase text-pink-500 transition-all hover:bg-pink-500/10 active:bg-pink-500/30 disabled:pointer-events-none disabled:opacity-50 disabled:shadow-none"
        type="button"
        data-ripple-dark="true"
      >
        Learn More
        <svg
          xmlns="http://www.w3.org/2000/svg"
          fill="none"
          viewBox="0 0 24 24"
          stroke-width="2"
          stroke="currentColor"
          aria-hidden="true"
          class="h-4 w-4"
        >
          <path
            stroke-linecap="round"
            stroke-linejoin="round"
            d="M17.25 8.25L21 12m0 0l-3.75 3.75M21 12H3"
          ></path>
        </svg>
      </button>
    </a>
  </div>
</div>


                    </div>'
                ],
               
               
            ]
            ];
            Renderer::render("components\post", $viewData);
    }
}