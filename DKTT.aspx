<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DKTT.aspx.cs" Inherits="SDH_VICTORY.DKTT" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="Bootstrap/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css" />

    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css"/>
    <script src="https://cdn.jsdelivr.net/npm/jquery@3.7.1/dist/jquery.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>

    <link href="chosen/chosen.css" rel="stylesheet" />
    <script src="chosen/chosen.js"></script>
    <style type="text/css">
        .auto-style1 {
            color: #FF0000;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <asp:ScriptManager runat="server" />
        <div class=" mt-4">
            <div class="row">
                <div class="col-lg-1">

                </div>
                <div class="col" id="form_dk">
                    <div class="row">
                        <div class="col">
                            <asp:Image PostBackUrl="Index" runat="server" ImageUrl="~/Data/img/logo_bieumau.png" Style="object-fit: contain; width: 100%;" />
                        </div>
                    </div>
                    <div class="text-center">
                        <asp:LinkButton CssClass="fas fa-home" Font-Underline="false" Font-Size="Large" Style="color: blue" PostBackUrl="Index" runat="server" />
                    </div>
                    <div class="alert alert-info text-justify">
                        <h2>Hướng dẫn đăng ký trực tuyến</h2>
                        <p><b>Bước 1:</b>
                            Học viên đăng ký theo <a>mẫu số 1</a> 
                        </p>
                        <p>
                            <b>Bước 2:</b>
                            Học viên đăng ký theo <a >mẫu số 2</a>
                        </p>
                    </div>
                    <div class="alert alert-danger text-justify">
                        <h2><u><b>Ghi chú:</b></u><br />Thí sinh vui lòng điền đầy đủ thông tin mục có dấu *</h2>
                        
                    </div>
                    <div class="card" id="mau1">
                        <div class="card-header">
                            <h2>Mẫu số 1: Thông tin cá nhân</h2>
                        </div>
                        <div class="card-body">
                            <div class="row text-dark font-weight-bold mb-4">
                                <div class="col-lg-3">
                                    <p>Họ tên<span class="auto-style1">*</span></p>
                                    <asp:TextBox runat="server" required="true" ID="txt_hoten" CssClass="form-control * form-control-sm" placeholder="Họ tên" />
                                </div>
                                <div class="col-lg-3">
                                    <p>Giới tính<span class="auto-style1">*</span></p>
                                    <asp:RadioButtonList runat="server" ID="rd_gt" CssClass="w-100" RepeatLayout="Table" RepeatDirection="Horizontal">
                                        <asp:ListItem Text="Nam" Selected="True" />
                                        <asp:ListItem Text="Nữ" />
                                    </asp:RadioButtonList>
                                    
                                </div>
                                <div class="col-lg-3">
                                    <p>Ngày sinh<span class="auto-style1">*</span></p>
                                    <asp:TextBox runat="server" required="true" ID="txt_ngaysinh" CssClass="form-control * form-control-sm" TextMode="Date" />
                                </div>
                                
                            </div>
                            <div class="row text-dark font-weight-bold mb-4">
                                <div class="col-lg-3">
                                    <p>CCCD/Hộ chiếu<span class="auto-style1">*</span></p>
                                    <asp:TextBox runat="server" required="true" ID="txt_cccd" CssClass="form-control * form-control-sm" placeholder="CCCD" />
                                </div>
                                <div class="col-lg-3">
                                    <p>Ngày cấp<span class="auto-style1">*</span></p>
                                    <asp:TextBox runat="server" required="true" ID="txt_ngaycap_cccd" TextMode="Date" CssClass="form-control * form-control-sm" />
                                </div>
                                <div class="col-lg-3">
                                    <p>Nơi cấp<span class="auto-style1">*</span></p>
                                    <asp:TextBox runat="server" required="true" ID="txt_noicap_cccd" CssClass="form-control * form-control-sm" placeholder="Nơi cấp" />
                                </div>
                            </div>
                            <div class="row text-dark font-weight-bold mb-4">
                                <div class="col-lg-3">
                                    <p>Số điện thoại<span class="auto-style1">*</span></p>
                                    <asp:TextBox TextMode="Phone" pattern="[0-9]{10,11}" required="true" runat="server" ID="txt_sdt" CssClass="form-control * form-control-sm" placeholder="SĐT" />
                                </div>
                                <div class="col-lg-3">
                                    <p>Email<span class="auto-style1">*</span></p>
                                    <asp:TextBox runat="server" TextMode="Email" required="true" ID="txt_email" CssClass="form-control * form-control-sm" placeholder="Email" />
                                </div>
                                <div class="col-lg-3">
                                    <p>Cơ quan<span class="auto-style1">*</span></p>
                                    <asp:TextBox runat="server" required="true" ID="txt_coquan" CssClass="form-control * form-control-sm" placeholder="Cơ quan" />
                                </div>
                            </div>
                            <div class="row text-dark font-weight-bold mb-4">
                                <div class="col-lg-3">
                                    <p>Nơi sinh<span class="auto-style1">*</span></p>
                                    <asp:DropDownList runat="server" ID="drop_tinhthanh" CssClass="select">
                                    </asp:DropDownList>
                                </div>
                                <div class="col-lg-3">
                                    <p>Địa chỉ</p>
                                    <asp:TextBox runat="server" ID="txt_diachi" CssClass="form-control  form-control-sm" placeholder="Địa chỉ" />
                                </div>
                                <div class="col-lg-3" style="display:none">
                                    <p>Minh chứng ưu tiên(nếu có chỉ pdf và ảnh jpeg, jpg, png)</p>
                                    <asp:FileUpload accept=".pdf,.jpg,.jpeg,.png" runat="server" ID="up_file_DTUT" />
                                </div>
                                <div class="col-lg-3">
                                   
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="card">
                        <div class="card-header">
                            <h2>Mẫu số 2: Thông tin tuyển sinh</h2>
                        </div>
                        <div class="card-body">
                            <div class="row text-dark font-weight-bold mb-4">
                                <div class="col-lg-6">
                                    <p>Thông tin tuyển sinh là<span class="auto-style1">*</span></p>
                                    <asp:RadioButtonList runat="server" CssClass="w-100 " required="true" ID="rd_ttts" RepeatLayout="Table" RepeatDirection="Horizontal">
                                        <asp:ListItem value="CH" Text="1. Cao học" />
                                        <asp:ListItem value="NCS" Text="2. Nghiên cứu sinh" />
                                        <asp:ListItem value="BTKT" Text="3. Bổ túc kiến thức" />
                                    </asp:RadioButtonList>
                                </div>
                            </div>
                            <asp:UpdatePanel runat="server">
                                <ContentTemplate>
                                    <div class="row text-dark font-weight-bold mb-4">
                                        <div class="col-lg-6">
                                            <p>Ngành bạn mong muốn học<span class="auto-style1">*</span></p>
                                            <asp:DropDownList runat="server" ID="dr_Nganhhoc" OnSelectedIndexChanged="dr_Nganhhoc_SelectedIndexChanged" AutoPostBack="true" CssClass="select">
                                            </asp:DropDownList>
                                        </div>
                                        <div class="col-lg-3">
                                            <p>Ngành bạn tốt nghiệp bậc đại học<span class="auto-style1">*</span></p>
                                            <asp:DropDownList runat="server" ID="txt_nganhtn" OnSelectedIndexChanged="dr_Nganhhoc_SelectedIndexChanged" AutoPostBack="true" CssClass="select">
                                            </asp:DropDownList>
                                        </div>
                                        <div class="col-lg-2">
                                            <p>Năm bạn tốt nghiệp<span class="auto-style1">*</span></p>
                                            <asp:TextBox runat="server" ID="txt_namtn" CssClass="form-control  form-control-sm" placeholder="Nhập năm" />
                                        </div>
                                    </div>
                                    <asp:Label Text="" Visible="false" ID="alert_bskt" ForeColor="Red" Font-Bold="true" runat="server" />

                                </ContentTemplate>
                            </asp:UpdatePanel>
                            <div class="row text-dark font-weight-bold mb-4">
                                <div class="col">
                                    <p>Thông tin bổ sung</p>
                                    <asp:TextBox runat="server" ID="txt_ghichu" CssClass="form-control" TextMode="MultiLine" />
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="alert alert-info text-justify font-weight-bold">
                       <h2>  Học viên sau khi nhập xong các thông tin đăng ký vui lòng bấm vào nút "Gửi thông tin đăng ký" dưới đây để gửi thông tin hồ sơ điện 
                        tử đến Viện Đào tạo sau đại học, Trường Đại học Trà Vinh
                           </h2> 
                        <asp:Button Text="Gửi thông tin đăng ký"  ID="btn_submit" OnClick="btn_submit_Click" CssClass="btn btn-primary" runat="server" />
                    </div>
                </div>
                <div class="col-lg-1">

                </div>
            </div>
        </div>
        <div class="modal fade" id="Modalalert" tabindex="-1" role="dialog"
            aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h4 class="modal-title text-primary">Thông báo</h4>

                    </div>
                    <div class="modal-body text-center">
                        <asp:Label ID="lbtb" CssClass="text-gray-900" runat="server"></asp:Label>
                    </div>
                    <div class="modal-footer">
                        <asp:LinkButton PostBackUrl="Index" Text="Đóng" CssClass="btn btn-secondary" runat="server" />
                    </div>
                </div>
            </div>
        </div>
        <script>
            $(function () {
                $(".select").chosen();
            });
            function check_form() {
                var elemnt = document.getElementById("form_dk");
                var req = elemnt.getElementsByClassName("*");
                var index = -1;
                for (var i = 0; i < req.length; i++) {
                    // Thực hiện các thao tác mong muốn với mỗi phần tử con ở đây
                    if (req[i].value == "") {
                        if (index == -1) {
                            index = i;
                        }
                        req[i].style.border = '2px solid red';
                    } else {
                        req[i].style.border = '';
                    }
                }
                if (index!=-1) {
                    openModalalert("Vui lòng điền đầy đủ thông tin vào các ô màu đỏ!!!");

                    req[index].focus();
                    return false;
                }
                return true;
            }
            function openModalalert(texttb) {
                $('#Modalalert').modal({ backdrop: 'static' });
                document.getElementById('lbtb').innerHTML = texttb;
            }
            function pageLoad(sender, args) {
                if (args.get_isPartialLoad()) {
                    // Reinitialize Chosen plugin after partial postback
                    $(".select").chosen();
                }
            }
        </script>
    </form>
</body>
</html>
