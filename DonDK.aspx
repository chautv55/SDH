<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="DonDK.aspx.cs" Inherits="SDH_VICTORY.DonDK" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .block{
            display:block;
            color:black;
            border: 1px solid #ced4da;
            background-color: white;
            padding: .375rem .75rem;
            width: 100%;
            border-radius: .25rem;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="">
        <asp:UpdatePanel runat="server">
            <ContentTemplate>
                <div class="alert alert-warning text-justify">
                    <div class="container">
                        <div class="d-flex justify-content-center">
                            <div>
                            <asp:TextBox runat="server" onblur="return post_(this);" OnTextChanged="txt_date_TextChanged" TextMode="Date" CssClass="form-control" ID="txt_date" />
                            </div>
                            <asp:RadioButtonList ID="rd_loaihs" AutoPostBack="true"
                                OnSelectedIndexChanged="rd_loaihs_SelectedIndexChanged" RepeatDirection="Horizontal" runat="server">
                                <asp:ListItem Text="Tư vấn"></asp:ListItem>
                                <asp:ListItem Text="Thạc sĩ"></asp:ListItem>
                                <asp:ListItem Text="Chuyên khoa"></asp:ListItem>
                            </asp:RadioButtonList>
                        </div>
                    </div>
                    
                </div>
                <div class="mt-2">
                    <div class="row">
                        <div class="col-lg">
                            <asp:GridView runat="server" AutoGenerateColumns="false" OnRowDataBound="gv_tuvan_RowDataBound"
                                ID="gv_tuvan" Visible="false" CssClass="table table-sm table-bordered table-hover">
                                <Columns>
                                    <asp:TemplateField ItemStyle-HorizontalAlign="Center" ItemStyle-VerticalAlign="Middle">
                                        <ItemTemplate>
                                            <asp:CheckBox ToolTip='<%# Bind("ID") %>' OnCheckedChanged="cb_duyet_CheckedChanged" AutoPostBack="true" runat="server" ID="cb_duyet"></asp:CheckBox>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:BoundField ItemStyle-Width="100px" DataField="ngay" ItemStyle-VerticalAlign="Middle" HeaderText="Ngày giờ" />
                                    <asp:TemplateField HeaderText="Họ t&#234;n">
                                        <ItemTemplate>
                                            <asp:Label runat="server"  ID="lb_hoten"></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Email">
                                        <ItemTemplate>
                                            <asp:Label runat="server"  ID="lb_email"></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="SDT">
                                        <ItemTemplate>
                                            <asp:Label runat="server"  ID="lb_sdt"></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Mục ti&#234;u">
                                        <ItemTemplate>
                                            <asp:Label runat="server"  ID="lb_luachon"></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Ng&#224;nh học">
                                        <ItemTemplate>
                                            <asp:Label runat="server"  ID="lb_nganhhoc"></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Tốt nghiệp">
                                        <ItemTemplate>
                                            <asp:Label runat="server"  ID="lb_totnghiep"></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Nội dung chi tiết">
                                        <ItemTemplate>
                                            <asp:Label Text="" ID="lb_noidung" runat="server" />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                </Columns>
                                <HeaderStyle CssClass="bg-primary-tvu text-white text-center" />
                            </asp:GridView>
                            <asp:GridView id="gv_ts_ck" OnRowDataBound="gv_ts_ck_RowDataBound" Visible="false" AutoGenerateColumns="false" 
                                runat="server" CssClass="table table-sm table-bordered table-hover">
                                <HeaderStyle CssClass="bg-primary-tvu text-white text-center" />
                                <RowStyle VerticalAlign="Middle" />
                                <Columns>
                                    <asp:TemplateField ItemStyle-HorizontalAlign="Center" ItemStyle-VerticalAlign="Middle">
                                        <ItemTemplate>
                                            <asp:CheckBox ToolTip='<%# Bind("ID") %>' ID="cb_duyet_ts_ck" OnCheckedChanged="cb_duyet_CheckedChanged" AutoPostBack="true" runat="server" ></asp:CheckBox>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:BoundField ItemStyle-Width="100px" DataField="ngay" ItemStyle-VerticalAlign="Middle" HeaderText="Ngày giờ" />
                                    <asp:TemplateField HeaderText="Họ tên">
                                        <ItemTemplate>
                                            <asp:Label Text="" ID="lb_hoten" runat="server" />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="SDT">
                                        <ItemTemplate>
                                            <asp:Label Text="" ID="lb_sdt" runat="server" />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Email">
                                        <ItemTemplate>
                                            <asp:Label Text="" ID="lb_email" runat="server" />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Ngành dự tuyển">
                                        <ItemTemplate>
                                            <asp:Label Text="" ID="lb_nganh" runat="server" />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Email">
                                        <ItemTemplate>
                                            <asp:LinkButton Text="🔍 Xem" OnClick="btn_Xem_Click" CommandArgument='<%# Bind("ID") %>' ID="btn_Xem" runat="server" />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                </Columns>
                            </asp:GridView>
                        </div>
                    </div>
                </div>
            </ContentTemplate>
        </asp:UpdatePanel>
        <div style="display:none">

        <asp:UpdatePanel runat="server">
            <ContentTemplate>
                <div class="alert alert-warning text-justify">
                    <asp:RadioButtonList ID="rd_loaidk" AutoPostBack="true" OnSelectedIndexChanged="rd_loaidk_SelectedIndexChanged"
                        RepeatDirection="Horizontal" RepeatLayout="Table" runat="server">
                    </asp:RadioButtonList>
                    <asp:RadioButtonList ID="rd_trangthai" AutoPostBack="true" runat="server" RepeatDirection="Horizontal" RepeatLayout="Table">
                        <asp:ListItem Text="Chưa Duyệt" Selected="True" />
                        <asp:ListItem Text="Duyệt" />
                    </asp:RadioButtonList>
                </div>
                <div class="alert alert-info">
                    <asp:TextBox runat="server" CssClass="form-control" ID="txt_timdondk" AutoPostBack="true" OnTextChanged="txt_timdondk_TextChanged" placeholder="Tìm đơn đăng ký theo tên" />
                </div>
                <div class="row">
                    <div class="col">
                        <asp:GridView CssClass="table table-bordered table-sm" AutoGenerateColumns="false" runat="server" ID="gv_ds_dk"
                            OnRowDataBound="gv_ds_dk_RowDataBound">
                            <Columns>
                                <asp:BoundField DataField="ngaydk" HeaderText="Ngày đăng ký" />
                                <asp:TemplateField HeaderText="Người đăng ký">
                                    <ItemTemplate>
                                        <asp:LinkButton ID="btn_file" OnClick="btn_file_Click" CssClass="w-100" CommandArgument='<%# Eval("id") %>' runat="server" />
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                        </asp:GridView>
                    </div>
                </div>
            </ContentTemplate>
        </asp:UpdatePanel>
        </div>
    </div>
    <div class="modal fade" id="Modal_dangky_user" tabindex="-1" role="dialog"
    aria-hidden="true">
    <div class="modal-dialog modal-xl" role="document">
        <div class="modal-content">
            <div class="modal-body text-center">
                <div class="card">
                    <asp:UpdatePanel runat="server">
                        <ContentTemplate>
                            <div class="card-body" style="overflow: auto; max-height: 50rem">
                                <div class="table ">
                                    <div class="row mb-2">
                                        <div class="col-lg-3 mb-2">
                                            <asp:Label ID="hoten" CssClass="block" runat="server" />
                                        </div>
                                        <div class="col-lg-3 mb-2">
                                            <asp:Label ID="gioitinh" CssClass="block" runat="server" />
                                        </div>
                                        <div class="col-lg-3 mb-2">
                                            <asp:Label ID="ngaysinh" CssClass="block" runat="server" />
                                        </div>
                                        <div class="col-lg-3 mb-2">
                                            <asp:Label ID="noisinh" CssClass="block" runat="server" />
                                        </div>
                                        <div class="col-lg-3 mb-2">
                                            <asp:Label ID="cccd" CssClass="block" runat="server" />
                                        </div>
                                        <div class="col-lg-3 mb-2">
                                            <asp:Label ID="ngaycap" CssClass="block" runat="server" />
                                        </div>
                                        <div class="col-lg-3 mb-2">
                                            <asp:Label ID="noicap" CssClass="block" runat="server" />
                                        </div>
                                        <div class="col-lg-3 mb-2">
                                            <asp:Label ID="diachi" CssClass="block" runat="server" />
                                        </div>
                                        <div class="col-lg-3 mb-2">
                                            <asp:Label ID="sdt" CssClass="block" runat="server" />
                                        </div>
                                        <div class="col-lg-3 mb-2">
                                            <asp:Label ID="email" CssClass="block" runat="server" />
                                        </div>
                                        <div class="col-lg-3 mb-2">
                                            <asp:Label ID="coquan" CssClass="block" runat="server" />
                                        </div>
                                        <div class="col-lg-3 mb-2">
                                        </div>
                                    </div>
                                    <div class="row mb-2">
                                        <div class="col">
                                            <div id="previewContainer" runat="server">
                                            </div>
                                        </div>
                                    </div>

                                </div>
                            </div>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                    
                </div>
                
            </div>
            <div class="modal-footer">
                <asp:UpdatePanel runat="server">
                    <ContentTemplate> 
                        <div class="form-inline">

                        <asp:TextBox ID="txt_mahv" Visible="false" CssClass="form-control" placeholder="Mã HV" runat="server" required="true" />
                        <asp:Button OnClientClick="CloseModal_dangky_user();" Text="Duyệt" CssClass="btn btn-primary" ID="btn_duyet_user_info" runat="server" OnClick="btn_duyet_user_info_Click" />
                        <asp:Button OnClientClick="CloseModal_dangky_user();" Text="Không Duyệt" CssClass="btn btn-danger" ID="btn_khongduyet_user_info" OnClick="btn_khongduyet_user_info_Click" runat="server" />
                        </div>
                    </ContentTemplate>
                </asp:UpdatePanel>
               
                <button class="btn btn-secondary" type="button" data-dismiss="modal">Đóng</button>
            </div>
        </div>
    </div>
        <script>
            function openModal_dangky_user() {
                $('#Modal_dangky_user').modal();
            }
            function CloseModal_dangky_user() {
                $('#Modal_dangky_user').modal("hide");
            }
        </script>
</div>
    <div class="modal fade" id="modalChiTiet" tabindex="-1" role="dialog" aria-hidden="true">
    <div class="modal-dialog modal-lg" role="document">
        <div class="modal-content">

            <!-- Header -->
            <div class="modal-header bg-primary text-white">
                <h5 class="modal-title">Chi tiết hồ sơ</h5>
            </div>

            <!-- Body -->
            <div class="modal-body">
                <!-- Tabs -->
                <ul class="nav nav-tabs" role="tablist">
                    <li class="nav-item">
                        <a class="nav-link active" data-toggle="tab" href="#tabThongTin" role="tab">Thông tin</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" data-toggle="tab" href="#tabBangCap" role="tab">Bằng cấp</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" data-toggle="tab" href="#tabHoSo" role="tab">Hồ sơ điện tử</a>
                    </li>
                </ul>

                <!-- Nội dung tab -->
                <div class="tab-content p-3">
                    <!-- Thông tin -->
                    <div class="tab-pane fade show active" id="tabThongTin" role="tabpanel">
                        <asp:UpdatePanel runat="server">
                            <ContentTemplate>

                        <div class="row">
                            <div class="col-lg">
                                <p><b>Họ tên:</b>
                                    <asp:Label ID="lb_xemhoten" runat="server" /></p>
                            </div>
                            <div class="col-lg">
                                <p><b>Giới tính:</b>
                                    <asp:Label ID="lb_xemgioitinh" runat="server" /></p>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-lg">
                                <p>
                                    <b>Ngày sinh:</b>
                                    <asp:Label ID="lb_xemNGAYSINH" runat="server" />
                                </p>
                            </div>
                            <div class="col-lg">
                                <p>
                                    <b>Nơi sinh:</b>
                                    <asp:Label ID="lb_xemgnoisinh" runat="server" />
                                </p>
                            </div>
                            <div class="col-lg">
                                <p>
                                    <b>Dân tộc:</b>
                                    <asp:Label ID="lb_xemgdantoc" runat="server" />
                                </p>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-lg">
                                <p>
                                    <b>CCCD:</b>
                                    <asp:Label ID="lb_xemcccd" runat="server" />
                                </p>
                            </div>
                            <div class="col-lg">
                                <p>
                                    <b>Ngày cấp:</b>
                                    <asp:Label ID="lb_xemngaycap" runat="server" />
                                </p>
                            </div>
                            <div class="col-lg">
                                <p>
                                    <b>Nơi cấp:</b>
                                    <asp:Label ID="lb_xemnoicap" runat="server" />
                                </p>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-lg">
                                <p>
                                    <b>Điện thoại:</b>
                                    <asp:Label ID="lb_xemdienthoai" runat="server" />
                                </p>
                            </div>
                            <div class="col-lg">
                                <p>
                                    <b>Email:</b>
                                    <asp:Label ID="lb_xememail" runat="server" />
                                </p>
                            </div>
                            
                        </div>
                        <div class="row">
                            <div class="col-lg">
                                <p>
                                    <b>Nơi ở hiện nay (theo VNeID):</b>
                                    <asp:Label ID="lb_xemhokhau" runat="server" />
                                </p>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-lg">
                                <p>
                                    <b>Địa chỉ liên lạc:</b>
                                    <asp:Label ID="lb_xemdiachi" runat="server" />
                                </p>
                            </div>
                        </div>
                                
                                <hr />
                                <div class="row">
                                    <div class="col-lg">
                                        Đơn vị công tác
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-lg">
                                        <p><b>Công việc hiện nay:</b>
                                            <asp:Label ID="lb_xem_congviec" runat="server" /></p>
                                    </div>
                                    <div class="col-lg">
                                        <p>
                                            <b>Năm làm việc:</b>
                                            <asp:Label ID="lb_xem_namlv" runat="server" />
                                        </p>
                                    </div>
                                    <div class="col-lg">
                                        <p>
                                            <b>SĐT làm việc:</b>
                                            <asp:Label ID="lb_xem_sdtdonviv" runat="server" />
                                        </p>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-lg">
                                        <p>
                                            <b>Đơn vị :</b>
                                            <asp:Label ID="lb_xem_donvi" runat="server" />
                                        </p>
                                    </div>
                                    
                                    <div class="col-lg">
                                        <p>
                                            <b>Email làm việc:</b>
                                            <asp:Label ID="lb_xem_emaildonvi" runat="server" />
                                        </p>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-lg">
                                        <p>
                                            <b>Địa chỉ làm việc:</b>
                                            <asp:Label ID="lb_xem_diachi_donvi" runat="server" />
                                        </p>
                                    </div>
                                </div>
                            </ContentTemplate>
                        </asp:UpdatePanel>
                    </div>

                    <!-- Bằng cấp -->
                    <div class="tab-pane fade" id="tabBangCap" role="tabpanel">
                        <asp:UpdatePanel runat="server">
                            <ContentTemplate>
                                <div class="row">
                                    <div class="col-lg text-center text-primary">
                                        Thông tin văn bằng dự tuyển
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-lg">
                                        <p><b>Ngành:</b> <asp:Label ID="lb_xemnganh" runat="server" /></p>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-lg">
                                        <p><b>Hình thức đào tạo:</b> <asp:Label ID="lb_xem_hinhthuc" runat="server" /></p>
                                    </div>
                                    <div class="col-lg">
                                        <p><b>Xếp loại:</b> <asp:Label ID="lb_xem_xeploai" runat="server" /></p>
                                    </div>
                                    <div class="col-lg">
                                        <p><b>Số hiệu bằng:</b> <asp:Label ID="lb_xem_sohieu" runat="server" /></p>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-lg">
                                        <p><b>Năm tốt nghiệp:</b>
                                            <asp:Label ID="lb_xem_namtn" runat="server" /></p>
                                    </div>
                                    <div class="col-lg">
                                        <p><b>Cơ sở đào tạo:</b>
                                            <asp:Label ID="lb_xem_csdt" runat="server" /></p>
                                    </div>
                                </div>
                                
                                <hr />
                                <div class="row">
                                    <div class="col-lg text-center text-primary">
                                        Chứng chỉ hành nghề
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-lg">
                                        <p>
                                            <b>Chứng chỉ hành nghề (Số hiệu):</b>
                                            <asp:Label ID="lb_xem_cchn" runat="server" />
                                        </p>
                                    </div>
                                    <div class="col-lg">
                                        <p>
                                            <b>Ngày cấp:</b>
                                            <asp:Label ID="lb_xem_ngaycaphn" runat="server" />
                                        </p>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-lg">
                                        <p>
                                            <b>Nơi cấp:</b>
                                            <asp:Label ID="lb_xem_noicaphn" runat="server" />
                                        </p>
                                    </div>
                                    <div class="col-lg">
                                        <p>
                                            <b>Phạm vi:</b>
                                            <asp:Label ID="lb_xem_phamvihn" runat="server" />
                                        </p>
                                    </div>
                                </div>
                                <hr />
                                <div class="row">
                                    <div class="col-lg text-center text-primary">
                                        Thông tin xét miễn thi Ngoại ngữ
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-lg">
                                        <p>
                                            <b>Bằng cấp/Chứng chỉ:</b>
                                            <asp:Label ID="lb_xem_nn" runat="server" />
                                        </p>
                                    </div>
                                    <div class="col-lg">
                                        <p>
                                            <b>Số hiệu:</b>
                                            <asp:Label ID="lb_xem_shnn" runat="server" />
                                        </p>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-lg">
                                        <p>
                                            <b>Nơi cấp:</b>
                                            <asp:Label ID="lb_xem_noicap_nn" runat="server" />
                                        </p>
                                    </div>
                                    <div class="col-lg">
                                        <p>
                                            <b>Ngày cấp:</b>
                                            <asp:Label ID="lb_xem_ngaycap_nn" runat="server" />
                                        </p>
                                    </div>
                                </div>
                            </ContentTemplate>
                        </asp:UpdatePanel>
                        
                    </div>

                    <!-- Hồ sơ điện tử -->
                    <div class="tab-pane fade" id="tabHoSo" role="tabpanel">
                        <asp:UpdatePanel runat="server">
                            <ContentTemplate>
                                <asp:LinkButton OnClick="btn_phieudutuyen_Click" Visible="false" Text="📄 Phiếu dự tuyển" ID="btn_phieudutuyen" CssClass="btn btn-outline-primary btn-sm mt-2" runat="server" />
                                <asp:LinkButton OnClick="btn_phieudutuyen_Click" Visible="false" Text="📄 Sơ yếu lí lịch" ID="btn_soyeulilich" CssClass="btn btn-outline-primary btn-sm mt-2" runat="server" />
                                <asp:LinkButton OnClick="btn_phieudutuyen_Click" Visible="false" Text="📄 CCCD" ID="btn_cccd" CssClass="btn btn-outline-primary btn-sm mt-2" runat="server" />
                                <asp:LinkButton OnClick="btn_phieudutuyen_Click" Visible="false" Text="📄 Bằng đại học" ID="btn_bangdh" CssClass="btn btn-outline-primary btn-sm mt-2" runat="server" />
                                <asp:LinkButton OnClick="btn_phieudutuyen_Click" Visible="false" Text="📄 Bảng điểm" ID="btn_bangdiem" CssClass="btn btn-outline-primary btn-sm mt-2" runat="server" />
                                <asp:LinkButton OnClick="btn_phieudutuyen_Click" Visible="false" Text="📄 CC hành nghề" ID="btn_cc_hanhnghe" CssClass="btn btn-outline-primary btn-sm mt-2" runat="server" />
                                <asp:LinkButton OnClick="btn_phieudutuyen_Click" Visible="false" Text="📄 Xác nhận thâm niên" ID="btn_xacnhan_thamnien" CssClass="btn btn-outline-primary btn-sm mt-2" runat="server" />
                                <asp:LinkButton OnClick="btn_phieudutuyen_Click" Visible="false" Text="📄 Ảnh 4x6" ID="btn_anh4x6" CssClass="btn btn-outline-primary btn-sm mt-2" runat="server" />
                                <asp:LinkButton OnClick="btn_phieudutuyen_Click" Visible="false" Text="📄 Chứng chỉ ngoại ngữ" ID="btn_CCNN" CssClass="btn btn-outline-primary btn-sm mt-2" runat="server" />
                                <div class="row mt-2">
                                    <%--<asp:LinkButton Text="⬇ Tải tất cả" ID="btn_taiall" CssClass="btn btn-outline-success btn-sm" runat="server" />--%>
                                </div>
                            </ContentTemplate>
                        </asp:UpdatePanel>
                    </div>
                </div>
            </div>

            <!-- Footer -->
            <div class="modal-footer">
                <asp:UpdatePanel runat="server">
                    <ContentTemplate>
                        <%--<asp:LinkButton Text="Duyệt hồ sơ" CssClass="btn btn-primary" ID="btn_duyet_hs" OnClick="btn_duyet_hs_Click" runat="server" />--%>
                    </ContentTemplate>
                </asp:UpdatePanel>
                <button type="button" class="btn btn-secondary" data-dismiss="modal">Đóng</button>
            </div>

        </div>
    </div>
</div>
    <script>
        function modalChiTiet() {
            $('#modalChiTiet').modal('show');
        }
    </script>
</asp:Content>
