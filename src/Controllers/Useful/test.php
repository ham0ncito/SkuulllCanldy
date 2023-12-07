<?php

namespace Controllers\Useful;

use Controllers\PublicController;
use Views\Renderer;
use PHPMailer\PHPMailer\PHPMailer;
use PHPMailer\PHPMailer\Exception;
use Utilities\Site;
use Utilities\Validators;
use Utilities\Context;
use Utilities\Paging;

class Test extends PublicController
{
    public function run(): void
    {
        session_unset();
    }
}