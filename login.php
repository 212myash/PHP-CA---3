<?php
session_start();
ob_start();
include('php/db.php'); // Ensure this file uses MySQLi for database connection
?>

<!doctype html>
<html lang="en">
<?php include('header.php'); ?>
<body>

<div class="wrapper">
    <?php include('sidebar.php'); ?>

    <div class="main-panel">
        <?php include('navbar.php'); ?>

        <div class="content">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-lg-8 col-md-7">
                        <div class="card">
                            <div class="header">
                                <h4 class="title">User Log in</h4>
                            </div>
                            <div class="content">
                                <?php
                                // Check for error message
                                $err = isset($_GET['error']) ? $_GET['error'] : "";
                                if ($err == 'error') { ?>
                                    <div class="errormsgbox">Username and password don't match.</div>
                                <?php }

                                // If the user is not logged in, process login form
                                if (!isset($_SESSION['adminuser'])) {
                                    if ($_SERVER["REQUEST_METHOD"] == "POST") {
                                        // Sanitize and validate input
                                        $adminuser = htmlspecialchars(trim($_POST['adminuser']));
                                        $adminpassword = htmlspecialchars(trim($_POST['adminpassword']));

                                        // Prepare and execute SQL query securely
                                        $stmt = $conn->prepare("SELECT id, adminpassword FROM admin WHERE adminuser = ?");
                                        $stmt->bind_param("s", $adminuser);
                                        $stmt->execute();
                                        $result = $stmt->get_result();

                                        // Check if a matching user is found
                                        if ($result->num_rows == 1) {
                                            $row = $result->fetch_assoc();
                                            // Verify the password using password_verify
                                            if (password_verify($adminpassword, $row['adminpassword'])) {
                                                $_SESSION["adminuser"] = $adminuser;
                                                header("location:dashboard.php");
                                                exit(); // Make sure to exit after redirection
                                            } else {
                                                header("location:login.php?error=error");
                                                exit();
                                            }
                                        } else {
                                            header("location:login.php?error=error");
                                            exit();
                                        }

                                        // Close statement and connection
                                        $stmt->close();
                                        $conn->close();
                                    }
                                } else {
                                    header("location:dashboard.php");
                                    exit();
                                }
                                ob_end_flush();
                                ?>
                                <form action="login.php" method="post">
                                    <div class="row">
                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <label>Username</label>
                                                <input type="text" class="form-control border-input" placeholder="username" name="adminuser" id="adminuser" required>
                                            </div>
                                        </div>
                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <label>Password</label>
                                                <input type="password" class="form-control border-input" placeholder="password" name="adminpassword" id="adminpassword" required>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="text-center">
                                        <button type="submit" class="btn btn-info btn-fill btn-wd">Log in</button>
                                    </div>
                                    <div class="clearfix"></div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <?php include('footer.php'); ?>
    </div>
</div>

</body>

<?php include('javascript-include.php'); ?>

</html>