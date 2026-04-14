<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="QLTK.aspx.cs" Inherits="SDH_VICTORY.QLTK" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="modal" id="modal_newacc" >
    <div class="modal-dialog modal-lg" role="document">
        <div class="modal-content ">
            <div class="modal-header">
                <h4 class="modal-title text-primary">Tạo tài khoản Thành viên</h4>
            </div>
            <div class="modal-body text-center">

                <div class="row mb-2">
                    <div class="col-lg-3">
                        User name
                    </div>
                    <div class="col-lg">
                        <asp:TextBox runat="server" ID="txt_username" required="true" CssClass="form-control" placeholder="User name" />
                    </div>
                </div>
                <div class="row mb-2">
                    <div class="col-lg-3">
                        Password
                    </div>
                    <div class="col-lg">
                        <asp:TextBox runat="server" ID="txt_pw" required="true" TextMode="Password" CssClass="form-control" placeholder="Password" />
                    </div>
                </div>
                <div class="row mb-2">
                    <div class="col-lg-3">
                        Name
                    </div>
                    <div class="col-lg">
                        <asp:TextBox runat="server" ID="txt_name" required="true" CssClass="form-control" placeholder="Name" />
                    </div>
                </div>
                <div class="row mb-2">
                    <div class="col-lg-3">
                        Quyền sử dụng
                    </div>
                    <div class="col-lg">
                        <asp:DropDownList ID="dr_Phanquyen" CssClass="select" runat="server">
                        </asp:DropDownList>
                    </div>
                </div>

            </div>
            <div class="modal-footer">
                <asp:Button Text="Tạo tài khoản" ID="submit_taotk" OnClick="submit_taotk_Click" CssClass="btn btn-primary" runat="server" />
                <button class="btn btn-secondary" type="button" data-dismiss="modal">Đóng</button>
            </div>
        </div>
    </div>
</div>
    <div class="container ">
        <asp:UpdatePanel runat="server">
            <ContentTemplate>
                <div class="container  mt-2 d-flex justify-content-center">
                    <div class="">
                        <div class="custom-file">
                            <asp:FileUpload CssClass="custom-file-input" runat="server" ID="file_excel" accept=".xlsx" />
                            <label class="custom-file-label" for="file_excel">Choose file</label>
                        </div>
                    </div>

                        <asp:LinkButton Text="Load FILE" ID="btn_load_file" OnClick="btn_load_file_Click" CssClass="btn btn-primary " runat="server" />
                </div>
                <script>
                    // Add the following code if you want the name of the file appear on select
                    $(".custom-file-input").on("change", function () {
                        var fileName = $(this).val().split("\\").pop();
                        $(this).siblings(".custom-file-label").addClass("selected").html(fileName);
                    });
                </script>
            </ContentTemplate>
            <Triggers>
                <asp:PostBackTrigger ControlID="btn_load_file" />
            </Triggers>
        </asp:UpdatePanel>
        <asp:LinkButton Text="Thêm tài khoản" OnClick="btn_newacc_Click" ID="btn_newacc" CssClass="btn btn-primary mt-4" runat="server" />
        <asp:UpdatePanel runat="server">
            <ContentTemplate>
                <div class="row">
                    <div class="col">
                        <asp:TextBox runat="server" OnTextChanged="txt_timtk_TextChanged" AutoPostBack="true" CssClass="form-control mt-2 mb-2" ID="txt_timtk" placeholder="Tài khoản cần tìm" />
                    </div>
                </div>
                <div class="row">
                    <div class="col-lg" style="overflow: auto; max-height: 45rem">
                        <asp:GridView AutoGenerateColumns="false" OnSelectedIndexChanging="gv_qltk_SelectedIndexChanging" runat="server" ID="gv_qltk" CssClass="table table-bordered" OnRowDataBound="gv_qltk_RowDataBound"
                            OnRowUpdating="gv_qltk_RowUpdating"
                            OnRowDeleting="gv_qltk_RowDeleting" OnRowEditing="gv_qltk_RowEditing">
                            <Columns>
                                <asp:TemplateField ItemStyle-HorizontalAlign="Center">
                                    <ItemTemplate>
                                        <asp:LinkButton Font-Underline="false" OnClientClick="return confirm('Xóa người dùng này!');" CommandName="Delete" ToolTip="Remove" CssClass="far fa-trash-alt text-danger" runat="server" />
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField ItemStyle-HorizontalAlign="Center">
                                    <ItemTemplate>
                                        <asp:LinkButton Font-Underline="false" CommandName="Edit" ToolTip="Khôi phục mk" CssClass="fas fa-recycle text-primary" runat="server" />
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="STT" ItemStyle-HorizontalAlign="Center">
                                    <ItemTemplate>
                                        <%# Container.DataItemIndex + 1 %>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="T&#224;i khoản">
                                    <ItemTemplate>
                                        <asp:LinkButton CommandName="Select" CommandArgument='<%# Eval("user_name") %>' runat="server" Text='<%# Bind("user_name") %>' ID="lb_user"></asp:LinkButton>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="T&#234;n người d&#249;ng">
                                    <ItemTemplate>
                                        <asp:Label runat="server" Text='<%# Bind("name") %>' ID="Label1"></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>

                                <asp:TemplateField HeaderText="Vai tr&#242;">
                                    <ItemTemplate>
                                        <div class="row">
                                            <div class="col form-inline">
                                                <asp:DropDownList runat="server" AutoPostBack="true" OnTextChanged="dr_sua_quyen_TextChanged" CssClass="form-control form-control-sm" ID="dr_sua_quyen">
                                                </asp:DropDownList>
                                                <asp:LinkButton Text="" ID="edit_access" OnClick="edit_access_Click" CommandArgument='<%# Eval("user_name") %>' CssClass="fa fa-gear ml-2" ToolTip="Truy cập dữ liệu" Font-Underline="false"
                                                    runat="server" />
                                            </div>
                                        </div>

                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Lần đăng nhập cuối">
                                    <ItemTemplate>
                                        <asp:Label runat="server" Text='<%# Bind("log_time") %>' ID="Label2"></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>

                                <asp:TemplateField HeaderText="Vô hiệu" ItemStyle-HorizontalAlign="Center">
                                    <ItemTemplate>
                                        <asp:CheckBox Checked='<%# Eval("vohieuhoa")!=null?Eval("vohieuhoa"):false %>' ID="cb_vohieu" OnCheckedChanged="cb_vohieu_CheckedChanged" runat="server" />
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                            <HeaderStyle CssClass="text-center" />
                        </asp:GridView>
                        <asp:GridView ID="gvSinhVien" OnRowDataBound="gvSinhVien_RowDataBound" CssClass="table table-sm table-bordered" runat="server" AutoGenerateColumns="true">
                            <Columns>
                                <asp:TemplateField HeaderText="STT" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center">
                                    <ItemTemplate>
                                        <%# Container.DataItemIndex + 1 %>
                                    </ItemTemplate>
                                    <ItemStyle HorizontalAlign="Center" />
                                </asp:TemplateField>
                            </Columns>
                        </asp:GridView>
                        <asp:LinkButton Text="Xác nhận" Visible="false" CssClass="btn btn-primary" ID="btn_link_add_excel" OnClick="btn_link_add_excel_Click" runat="server" />
                    </div>
                </div>
                <div class="row">
                    <div class="col-lg">
                        <asp:ListView runat="server" ID="lv_user_info">
                            <ItemTemplate>
                                <div class="card">
                                    <div class="card-body">

                                        <div class="row">
                                            <div class="col-lg-3 mb-2">
                                                <span class="">Họ tên:
                                <asp:Label runat="server" Enabled="false" ID="txt_suahoten" required="true" Text='<%# Eval("hoten") %>' />
                                                </span>
                                            </div>
                                            <div class="col-lg-3 mb-2">
                                                <span class="">Giới tính:
                                <asp:Label runat="server" Enabled="false" ID="txt_suagt" required="true" Text='<%# Eval("gioitinh") %>' />
                                                </span>
                                            </div>
                                            <div class="col-lg-3 mb-2">
                                                <span class="">Ngày sinh:
                                <asp:Label runat="server" Enabled="false" ID="txt_suangaysinh" required="true" TextMode="Date" Text='<%# (Eval("NS")!=null && Eval("NS").ToString()!="")? DateTime.Parse( Eval("NS").ToString()).ToString("yyyy-MM-dd"):"" %>' />
                                                </span>
                                            </div>
                                            <div class="col-lg-3 mb-2">
                                                <span class="">Nơi sinh:
                                <asp:Label runat="server" Enabled="false" ID="txt_suanoisinh" required="true" Text='<%# Eval("Noisinh") %>' />
                                                </span>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-lg-3 mb-2">
                                                <span class="">CCCD:
                                <asp:Label runat="server" Enabled="false" ID="txt_suacccd" required="true" Text='<%# Eval("CCCD") %>' />
                                                </span>
                                            </div>
                                            <div class="col-lg-3 mb-2">
                                                <span class="">Ngày cấp:
                                <asp:Label TextMode="Date" ID="txt_suangaycap" Enabled="false" required="true" runat="server"
                                    Text='<%# Eval("ngaycap")!=null?  DateTime.Parse(Eval("ngaycap").ToString()).ToString("yyyy-MM-dd"):""  %>' />
                                                </span>
                                            </div>
                                            <div class="col-lg-3 mb-2">
                                                <span class="">Nơi cấp:
                                <asp:Label runat="server" Enabled="false" ID="txt_suanoicap" required="true" Text='<%# Eval("noicap") %>' />
                                                </span>
                                            </div>
                                            <div class="col-lg-3 mb-2">
                                                <span class="">Cơ quan:
                                <asp:Label runat="server" Enabled="false" ID="txt_suacoquan" Text='<%# Eval("Coquan") %>' />
                                                </span>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-lg-3 mb-2">
                                                <span class="">SĐT:
                                <asp:Label TextMode="Phone" Enabled="false" ID="txt_suasdt" runat="server" required="true" Text='<%# Eval("sdt") %>' />
                                                </span>
                                            </div>
                                            <div class="col-lg-3 mb-2">
                                                <span class="">Email:
                                <asp:Label runat="server" Enabled="false" ID="txt_suaemail" TextMode="Email" required="true" Text='<%# Eval("Email") %>' />
                                                </span>
                                            </div>
                                            <div class="col-lg-6 mb-2">
                                                <p class="">
                                                    Địa chỉ:
                                <asp:Label runat="server" Enabled="false" ID="txt_suadiachi" TextMode="MultiLine" Text='<%# Eval("diachi") %>' />
                                                </p>
                                            </div>

                                        </div>

                                    </div>
                                </div>
                            </ItemTemplate>
                        </asp:ListView>
                        <asp:SqlDataSource runat="server" ID="user_info"
                            ConnectionString='<%$ ConnectionStrings:SDHConnectionString %>'
                            SelectCommand="SELECT [user_name], [hoten], [NS], [CCCD], [ngaycap], [noicap], [sdt], [Email], [Noisinh], [Coquan], [diachi], [gioitinh], [DTUT] FROM [User_info] WHERE ([user_name] = @user_name2)"
                            OldValuesParameterFormatString="original_{0}">
                            <SelectParameters>
                                <asp:QueryStringParameter QueryStringField="x" Name="user_name2" Type="String"></asp:QueryStringParameter>
                            </SelectParameters>
                        </asp:SqlDataSource>
                    </div>
                </div>
                
            </ContentTemplate>
        </asp:UpdatePanel>
        
    </div>
    
    <div class="modal fade" id="modal_data_access" tabindex="-1" role="dialog" aria-hidden="true">
        <div class="modal-dialog " role="document">
            <div class="modal-content ">
                <div class="modal-header">
                    <h4 class="modal-title text-primary">Điều chỉnh quyền truy cập dữ liệu</h4>
                </div>
                <div class="modal-body text-center">
                    <asp:UpdatePanel runat="server">
                        <ContentTemplate>
                    <asp:CheckBoxList ID="cb_access_data" RepeatLayout="Table" RepeatDirection="Vertical" runat="server">
                        <asp:ListItem Text="All" Value="" />
                        <asp:ListItem Text="BVKT" />
                        <asp:ListItem Text="TRCBV" />
                        <asp:ListItem Text="SAUBV" />
                        <asp:ListItem Text="XETTN" />
                    </asp:CheckBoxList>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                </div>
                <div class="modal-footer">
                    <asp:UpdatePanel runat="server">
                        <ContentTemplate>
                            <asp:LinkButton Text="Lưu" OnClientClick="hidemodal_data_access();" CssClass="btn btn-primary" ID="btn_luu_access" OnClick="btn_luu_access_Click" runat="server" />
                        </ContentTemplate>
                    </asp:UpdatePanel>
                    <button class="btn btn-secondary" type="button" data-dismiss="modal">Đóng</button>
                </div>
            </div>
        </div>
    </div>
    
    <script>
        function openmodal_data_access() {
            $('#modal_data_access').modal();
        }
        function hidemodal_data_access() {
            $('#modal_data_access').modal('hide');
        }
        function openmodal_modal_newacc() {
            $('#modal_newacc').modal();
        }
        function hidemodal_modal_newacc() {
            $('#modal_newacc').modal('hide');
        }
    </script>
</asp:Content>
