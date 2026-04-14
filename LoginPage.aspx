<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="LoginPage.aspx.cs" Inherits="SDH_VICTORY.LoginPage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Trang đăng nhập</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" />
    <script src="https://cdn.jsdelivr.net/npm/jquery@3.7.1/dist/jquery.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container w-100" style="height: 100vh">
    <div class="d-flex justify-content-center align-content-center align-items-center h-100">
        <div class="card w-100 shadow-lg">
            <div class="card-body ">
                <div class="row">
                    <div class="col text-center">
                        <img src="Data/img/logoSDH.png" style="object-fit:fill" />
                    </div>
                </div>
                <div class="row">
                    <div style="display:none" class="col d-flex flex-column justify-content-center align-items-center">
                        <asp:ImageButton ID="LOGIN_GG" OnClick="LOGIN_GG_Click" Style="width: 100px; height: 100px;object-fit:contain" ImageUrl="~/Data/img/google.png" runat="server" />
                        <p></p>
                        <b>ĐĂNG NHẬP VỚI TÀI KHOẢN GMAIL</b>

                    </div>
                    <div class="col-lg font-weight-bold">

                        <h3>ĐĂNG NHẬP</h3>
                        <hr />
                        TÀI KHOẢN
                            <asp:TextBox runat="server" ID="txt_tk" placeholder="USERNAME" onkeydown="return handleEnterKey(event)" CssClass="form-control" />
                        MẬT KHẨU
                            <asp:TextBox runat="server" ID="txt_pw" placeholder="PASSWORD" onkeydown="return handleEnterKey(event)" TextMode="Password" CssClass="form-control" />
                        <p></p>
                        <asp:Button Text="ĐĂNG NHẬP" ID="btn_dn" CssClass="btn btn-primary w-100" runat="server" OnClick="btn_dn_Click" />
                        <p class="text-center">
                            <asp:Label Text="" ForeColor="Red" Font-Bold="true" ID="lb_alert" runat="server" />
                        </p>
                        <div class="row">
                            <div class="col text-center">
                                <asp:CheckBox Text="Lưu đăng nhập" ID="cb_save_user" runat="server" />
                            </div>
                            <div class="col text-center">
                                <asp:LinkButton Text="Quên mật khẩu?" data-toggle="modal" data-target="#Modal_quenmk" ID="btn_quenmk" runat="server" />
                            </div>
                        </div>
                        <div class=" text-center">
                            <asp:LinkButton Text="Chưa có tài khoản?" PostBackUrl="DKTT" runat="server" />
                        </div>

                    </div>

                </div>
            </div>
        </div>
    </div>
            
</div>
        <div class="modal fade" id="Modal_quenmk" tabindex="-1" role="dialog"
            aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h4 class="modal-title text-primary">Quên mật khẩu</h4>
                    </div>
                    <div class="modal-body">
                        <asp:TextBox runat="server" ID="txt_taikhoanQuen" placeholder="Tài khoản" CssClass="form-control" />
                    </div>
                    <div class="modal-body text-center">
                        <asp:Button Text="Xác nhận" data-toggle="modal" data-target="#Modal_quenmk" CssClass="btn btn-primary" ID="guiquenmk" OnClick="guiquenmk_Click" runat="server" />
                        <button class="btn btn-secondary" type="button" data-dismiss="modal">Đóng</button>
                    </div>
                </div>
            </div>
        </div>
    <script type="text/javascript">
        function handleEnterKey(event) {
            if (event.keyCode === 13) {
                event.preventDefault();
                document.getElementById('<%= btn_dn.ClientID %>').click(); // Kích hoạt sự kiện click của btn_dn
                return false;
            }
        }
    </script>
    </form>
</body>
</html>
