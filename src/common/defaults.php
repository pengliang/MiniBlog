<?php

// defaults.php

// this file defines standard positions of some important
// dirs or files.
define("CL_ROOT", realpath(dirname(dirname(__FILE__))));
define("INCLUDES_DIR", CL_ROOT."/includes/");
define("IMAGE_DIR",CL_ROOT."/images/");
define('SMARTY_DIR', INCLUDES_DIR . 'smarty/');
define('ACTION_ROOT',CL_ROOT."/actions/");
define('UPLOAD_ROOT',CL_ROOT."/uploads/");

set_include_path(ABS_PATH);
?>