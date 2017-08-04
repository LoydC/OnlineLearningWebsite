<?php
	
	$name = trim($_POST['name']);
	$email = $_POST['email'];
	$subject = $_POST['subject'];
	$comments = $_POST['comments'];
	
	$site_owners_email = 'YOUR_MAIL'; // Replace this with your own email address
	$site_owners_name = 'YOUR_NAME'; // replace with your name

	$error = "";
	
	if (strlen($name) < 2) {
		$error['name'] = "Please enter your name";	
	}
	
	if (!preg_match('/^[a-z0-9&\'\.\-_\+]+@[a-z0-9\-]+\.([a-z0-9\-]+\.)*+[a-z]{2}/is', $email)) {
		$error['email'] = "Please enter a valid email address";	
	}
	
	if (strlen($comments) < 3) {
		$error['comments'] = "Please leave a comment.";
	}

	if (!$error) {
		
		require_once('phpMailer/class.phpmailer.php');
		$mail = new PHPMailer();
		
		$mail->From = $email;
		$mail->FromName = $name;
		$mail->Subject = $subject;
		$mail->AddAddress($site_owners_email, $site_owners_name);
		$mail->Body = $comments;
		
		// GMAIL STUFF
		
		$mail->Mailer = "smtp";
		$mail->Host = "smtp.gmail.com";
		$mail->Port = 587;
		$mail->SMTPSecure = "tls"; 
		
		$mail->SMTPAuth = true; // turn on SMTP authentication
		$mail->Username = "YOUR_MAIL"; // SMTP username
		$mail->Password = "YOUR_PASSWORD"; // SMTP password
		
		$mail->Send();
		
		echo "<div class='alert alert-success'><i class='icon-flag'></i> Congratulations, " . $name . ". We've received your email. We'll be in touch as soon as we possibly can! </div>";
		
	} # end if no error
	else {

		$response = (isset($error['name'])) ? "<div class='alert alert-error'><i class='icon-warning-sign'></i>  " . $error['name'] . "</div> \n" : null;
		$response .= (isset($error['email'])) ? "<div class='alert alert-error'><i class='icon-warning-sign'></i> " . $error['email'] . "</div> \n" : null;
		$response .= (isset($error['comments'])) ? "<div class='alert alert-error'><i class='icon-warning-sign'></i> " . $error['comments'] . "</div>" : null;
		
		echo $response;
	} # end if there was an error sending

?>