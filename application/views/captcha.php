
<html>
<head>
    <title>How to Implement Google reCaptcha in Codeigniter</title>
    
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.0/jquery.min.js"></script>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" />
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
    <script src='https://www.google.com/recaptcha/api.js' async defer></script>
 
</head>
<body>
    <div class="container box">
        <br />
        <h2 align="center"><b>How to Implement Google reCaptcha in Codeigniter</b></h2>
        <br />
        <div class="panel panel-default">
            <div class="panel-heading">Fill Form Data</div>
            <div class="panel-body">
                <?php
                if($this->session->flashdata('message'))
                {
                ?>
                    <div class="alert alert-danger">
                        <?php
                        echo $this->session->flashdata('message');
                        ?>
                    </div>
                <?php
                }

                if($this->session->flashdata('success_message'))
                {
                ?>
                    <div class="alert alert-success">
                        <?php
                        echo $this->session->flashdata('success_message');
                        ?>
                    </div>
                <?php
                }
                ?>
                <form method="post" action="<?php echo base_url(); ?>captcha/validate">
                    <div class="form-group">
                        <label>First Name</label>
                        <input type="text" name="first_name" class="form-control" />
                    </div>
                    <div class="form-group">
                        <label>Last Name</label>
                        <input type="text" name="last_name" class="form-control" />
                    </div>
                    <div class="form-group">
                        <label>Age</label>
                        <input type="text" name="age" class="form-control" />
                    </div>
                    <div class="form-group">
                        <label>Gender</label>
                        <input type="text" name="gender" class="form-control" />
                    </div>
                    <div class="form-group">
                        <div class="g-recaptcha" data-sitekey="6LfMFiApAAAAAPrCm5X09BBqrSWyUdCrErPI8aTV"></div>
                    </div>
                    <div class="form-group">
                        <input type="submit" name="send" class="btn btn-success" value="Send" />
                    </div>
                </form>
            </div>
        </div>        
    </div>
</body>
</html>