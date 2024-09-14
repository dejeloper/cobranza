<?php
defined('BASEPATH') OR exit('No direct script access allowed');
?>
                <footer style="padding-bottom: 10px; background-color: #fff;">
                    <hr>
                    <p class="pull-right">
                        <a href="https://x.com/dejeloper" target="_blank"  style="font-weight: 600; color: #8a8a8a;">
                            Jhonatan Guerrero
                        </a> 
                        <span style="color: #8a8a8a;">
                            | 2018 - <?= date("Y"); ?>
                        </span>
                    </p>
                </footer>
            </div>
        </div>
<!--        <script>
            $(document).ready(function () {
                $(".cerrarSesion").on("click",function(event){
                    event.preventDefault();
                    $.ajax({
                        url: "< ?= base_url() . 'Login/signOut/'; ?>",
                        type: "POST", 
                        data: {},
                        success:function(){
                            location.href = "< ?= base_url(); ?>";
                        }
                    });
                });
            });
        </script>-->
    </body>
</html>