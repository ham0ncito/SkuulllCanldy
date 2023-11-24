<?php

namespace Controllers\Useful;

use Controllers\PublicController;
use Views\Renderer;
use Utilities\Site;
use Utilities\Validators;
use Utilities\Context;
use Utilities\Paging;

class Support extends PublicController
{

    public function run(): void
    {
        $viewData = array();
        $viewData = [
            "class" => "Support",
            "name" => "Support",
            "title" => " Technical Support Announcement: Resolving Your Music App Queries!",
            "text" => [
                [
                    "description" => "Are you experiencing technical hurdles while immersing yourself in the world of melodies and rhythms on our music app? Our dedicated support team is here to assist you!"
                ],
                [
                    "description" => "🔍 Common Issues Addressed:
                    
                    Thank you for choosing Skull2Candly - Where Every Beat Matters! 🎶✨"
                ],
                [
                    "description" => "Playback Problems: If you encounter issues with music playback, our team will guide you through troubleshooting steps to ensure uninterrupted music streaming."
                ],
                [
                    "description" => "
                    Account Assistance: Forgot your password or having trouble accessing your account? Reach out to us for swift resolution."
                ],
                [
                    "description" => "App Performance: Experiencing lags or glitches within the app? We're committed to optimizing your user experience."
                ],
                [
                    "description" => " 🤝 How to Reach Us:
                    
                   "
                ],
                [
                    "description" => " For immediate support, please contact our technical team via:"
                ],
                [
                    "description" => "
                    \n📧 Email: support@skull2candlycapp.com"
                ],
                [
                    "description" => " 
                    \n📞 Phone: +1-800-MUSIC-HELP"
                ],
                [
                    "description" => " 
                    \n💬 Live Chat: Visit our website to connect with an agent in real-time."
                ],
                [
                    "description" => " 
                    \nWe understand the importance of a seamless music journey and are dedicated to ensuring your experience on our app is flawless."
                ],
                [
                    "description" => "Best regards,"
                ],
                [
                    "description" => "Skull2Candly Support Team"
                ],

            ],
            "div" => [
                [
                    "code" => '<div class="flex justify-center items-center m-10"><div class="max-w-md mx-auto p-4 bg-gray-100 shadow-md rounded-md"><form method="post" action="index.php?page=Useful_Support">
<div class="mb-4"><label for="name" class="block text-gray-700 font-semibold mb-2">Name:</label><input type="text"
        id="name" name="name" required
        class="w-full border-2 border-gray-300 p-2 rounded-md focus:outline-none focus:border-blue-500"></div>
<div class="mb-4"><label for="email" class="block text-gray-700 font-semibold mb-2">Email:</label><input type="email"
        id="email" name="email" required
        class="w-full border-2 border-gray-300 p-2 rounded-md focus:outline-none focus:border-blue-500"></div>
<div class="mb-4"><label for="message" class="block text-gray-700 font-semibold mb-2">Message:</label><textarea
        id="message" name="message" rows="4" required
        class="w-full border-2 border-gray-300 p-2 text-black rounded-md focus:outline-none focus:border-blue-500"></textarea>
</div>
<div class="text-center"><input type="submit" value="Submit"
        class="bg-blue-500 hover:bg-blue-700 text-white font-bold py-2 px-4 rounded focus:outline-none focus:shadow-outline">
</div>
</form>
</div>
</div>'

],

]
];
$viewData['BASE_DIR'] = "SkuulllCanldy";
$this->verifyData();
Renderer::render("components\post", $viewData);

}
public static function verifyData()
{
if ($_SERVER["REQUEST_METHOD"] == "POST") {

$name = isset($_POST['name']) ? $_POST['name'] : '';
$email = isset($_POST['email']) ? $_POST['email'] : '';
$message = isset($_POST['message']) ? $_POST['message'] : '';


if (empty($name) || empty($email) || empty($message)) {

echo '<script>
alert("Please fill in all fields.");
</script>';
} else {

echo '<script>
';
echo 'alert("Thank you for contacting us!\n\nName: '.$name.
'\nEmail: '.$email.
'\nMessage: '.$message.
'");';
echo '
</script>';
}
}
}
}