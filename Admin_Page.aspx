<%@ Page Title="" Language="C#" ValidateRequest="false" MasterPageFile="~/MasterPage_Index.Master" 
    AutoEventWireup="true" CodeBehind="Admin_Page.aspx.cs" Inherits="SDH_VICTORY.Admin_Page" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .image-dropdown {
            position: relative;
            display: inline-block;
        }

        .text-break {
            white-space: normal; /* Cho phép chữ xuống dòng */
            word-wrap: break-word; /* Chữ dài sẽ tự xuống dòng */
            overflow-wrap: break-word; /* Đảm bảo chữ dài sẽ tự động xuống dòng */
        }

        .dropdown-btn {
            background-color: #f1f1f1;
            border: none;
            color: black;
            padding: 10px 20px;
            font-size: 16px;
            cursor: pointer;
        }

        .dropdown-content {
            display: none;
            position: absolute;
            background-color: #f9f9f9;
            min-width: 160px;
            box-shadow: 0 8px 16px 0 rgba(0,0,0,0.2);
            z-index: 1;
        }

            .dropdown-content img {
                width: 100px; /* Chiều rộng của ảnh trong dropdown */
                display: block;
                margin: 5px;
                cursor: pointer;
            }

                .dropdown-content img:hover {
                    opacity: 0.7;
                }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
  
        <div class="mb-4">

            <asp:UpdatePanel runat="server">
                <ContentTemplate>
                    <div class="row " style="display: none">
                        <div class="col">
                            <div class="card">
                                <div class="card-header">
                                    <div class="form-inline">
                                        <asp:LinkButton Text="Quản lý tài khoản" ID="hd_qltk" Font-Underline="false" runat="server" OnClick="hd_qltk_Click1" />
                                        <div class="ml-auto ">
                                            <button data-toggle="modal" data-target="#Modala_taotk" class="btn btn-primary" type="button">Thêm</button>
                                        </div>
                                    </div>
                                </div>
                                <div class="card-body collapse" id="qltk" runat="server">
                                    <asp:TextBox runat="server" placeholder="Tài khoản tìm kiếm" ID="timtk" AutoPostBack="true" CssClass="form-control" OnTextChanged="timtk_TextChanged" />
                                    <div style="overflow: auto; max-height: 45rem">

                                        <asp:GridView ID="gv_qltk" AutoGenerateColumns="false" CssClass="table table-sm table-bordered mt-2" runat="server" ForeColor="#333333" GridLines="None"
                                            OnRowDeleting="gv_qltk_RowDeleting" OnRowEditing="gv_qltk_RowEditing" OnRowDataBound="gv_qltk_RowDataBound" OnRowUpdating="gv_qltk_RowUpdating">
                                            <Columns>
                                                <asp:TemplateField ItemStyle-HorizontalAlign="Center">
                                                    <ItemTemplate>
                                                        <asp:LinkButton Font-Underline="false" CommandName="Delete" ToolTip="Remove" CssClass="far fa-trash-alt text-danger" runat="server" />
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField ItemStyle-HorizontalAlign="Center">
                                                    <ItemTemplate>
                                                        <asp:LinkButton Font-Underline="false" CommandName="Edit" ToolTip="Khôi phục mk" CssClass="fas fa-recycle text-primary" runat="server" />
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="STT" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center">
                                                    <ItemTemplate>
                                                        <%# Container.DataItemIndex + 1 %>
                                                    </ItemTemplate>
                                                    <ItemStyle HorizontalAlign="Center" />
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="T&#224;i khoản">

                                                    <ItemTemplate>
                                                        <asp:Label runat="server" Text='<%# Bind("user_name") %>' ID="lb_user"></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>

                                                <asp:TemplateField HeaderText="Người d&#249;ng">
                                                    <ItemTemplate>
                                                        <asp:TextBox runat="server" AutoPostBack="true" OnTextChanged="txt_sua_name_TextChanged" Text='<%# Eval("name") %>' CssClass="border-0 form-control form-control-sm" ID="txt_sua_name"></asp:TextBox>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Vai tr&#242;">
                                                    <ItemTemplate>
                                                        <asp:DropDownList runat="server" AutoPostBack="true" OnSelectedIndexChanged="dr_sua_quyen_SelectedIndexChanged" ID="dr_sua_quyen" CssClass="custom-select .custom-select-sm"></asp:DropDownList>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Đăng nhập gần nhất">
                                                    <ItemTemplate>
                                                        <asp:Label runat="server" Text='<%# Bind("log_time") %>' ID="Label1"></asp:Label>
                                                    </ItemTemplate>
                                                    <ItemStyle HorizontalAlign="Center"></ItemStyle>
                                                </asp:TemplateField>

                                            </Columns>
                                            <AlternatingRowStyle BackColor="White"></AlternatingRowStyle>

                                            <PagerStyle HorizontalAlign="Center" BackColor="#2461BF" ForeColor="White"></PagerStyle>
                                            <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                            <RowStyle BackColor="#EFF3FB"></RowStyle>

                                            <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333"></SelectedRowStyle>

                                        </asp:GridView>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </ContentTemplate>
            </asp:UpdatePanel>
            <div class="card">
                <div class="card-header">
                    <asp:LinkButton Text="Quản lý bài" ID="btn_manager_allbaiviet" OnClick="btn_manager_allbaiviet_Click" runat="server" />
                </div>
                <div class="card-body" id="body_qlbai" runat="server" visible="false">
                    <asp:UpdatePanel runat="server">
                        <ContentTemplate>
                            <div class="container form-inline">
                                <asp:LinkButton ToolTip="SLIDE" OnClick="btn_Slide_Click" CssClass=" btn btn-outline-primary btn-sm ml-2 " runat="server">
                            <span class="fas fa-pager"> </span>
                                </asp:LinkButton>
                                <asp:LinkButton ToolTip="THÔNG BÁO" OnClick="btn_qltb_Click" CssClass="btn btn-outline-danger btn-sm ml-2 " runat="server">
                            <span class="fas fa-bullhorn"></span>
                                </asp:LinkButton>
                                <asp:LinkButton ToolTip="TIN TỨC" OnClick="btn_ql_tt_Click" CssClass="btn btn-outline-primary btn-sm ml-2" runat="server">
                            <span class="far fa-newspaper"></span>
                                </asp:LinkButton>
                                <asp:LinkButton ToolTip="TUYỂN SINH" OnClick="btn_ql_ts_Click" CssClass="btn btn-outline-warning btn-sm ml-2" runat="server">
                            <span class="far fa-address-card"></span>
                                </asp:LinkButton>
                                <asp:LinkButton ToolTip="NGHIÊN CỨU SINH" OnClick="btn_ql_ncs_Click" CssClass="btn btn-outline-success btn-sm ml-2" runat="server">
                            <span class="fas fa-id-card-alt"></span>
                                </asp:LinkButton>
                                <asp:LinkButton ToolTip="CAO HỌC" OnClick="btn_ql_caohoc_Click" CssClass="btn btn-outline-info btn-sm ml-2" runat="server">
                            <span class="fas fa-user-tie"></span>
                                </asp:LinkButton>
                                <asp:LinkButton ToolTip="CHUYÊN KHOA" OnClick="btn_ql_ck2_Click" CssClass="btn btn-outline-primary btn-sm ml-2" runat="server">
                            <span class="fas fa-user-graduate"></span>
                                </asp:LinkButton>
                                <asp:LinkButton ToolTip="HỘP THƯ ĐĂNG" OnClick="btn_tb_lichbv_Click" CssClass="btn btn-outline-primary btn-sm ml-2" runat="server">
<span class="fas fa-file-signature"></span>
                                </asp:LinkButton>
                                <asp:LinkButton ToolTip="VIDEO NHÚNG" OnClick="btn_ytb_video_Click" CssClass="btn btn-outline-danger btn-sm ml-2" runat="server">
<span class="fab fa-youtube-square"></span>
                                </asp:LinkButton>
                                <asp:LinkButton ToolTip="LỊCH TS" ID="btn_lichTS" OnClick="btn_lichTS_Click" CssClass="btn btn-outline-success btn-sm ml-2" runat="server">
<span class="far fa-calendar-plus"></span>
                                </asp:LinkButton>
                                <asp:LinkButton ToolTip="HỘI ĐỒNG" ID="BTN_HOIDONG" OnClick="BTN_HOIDONG_Click" CssClass="btn btn-outline-danger btn-sm ml-2" runat="server">
<span class="fas fa-users"></span>
                                </asp:LinkButton>
                            </div>
                        </ContentTemplate>
                    </asp:UpdatePanel>

                <hr class="bg-primary"  />
                    <asp:UpdatePanel runat="server">
                        <ContentTemplate>
                            <asp:SqlDataSource runat="server" ID="PhongHDBV" ConnectionString='<%$ ConnectionStrings:SDHConnectionString %>' SelectCommand="SELECT * FROM [Phong_HDBV]" ConflictDetection="CompareAllValues" DeleteCommand="DELETE FROM [Phong_HDBV] WHERE [id] = @original_id AND [phong] = @original_phong AND (([diachi] = @original_diachi) OR ([diachi] IS NULL AND @original_diachi IS NULL))" InsertCommand="INSERT INTO [Phong_HDBV] ([phong], [diachi]) VALUES (@phong, @diachi)" OldValuesParameterFormatString="original_{0}" UpdateCommand="UPDATE [Phong_HDBV] SET [phong] = @phong, [diachi] = @diachi WHERE [id] = @original_id AND [phong] = @original_phong AND (([diachi] = @original_diachi) OR ([diachi] IS NULL AND @original_diachi IS NULL))">
                                <DeleteParameters>
                                    <asp:Parameter Name="original_id" Type="Int32"></asp:Parameter>
                                    <asp:Parameter Name="original_phong" Type="String"></asp:Parameter>
                                    <asp:Parameter Name="original_diachi" Type="String"></asp:Parameter>
                                </DeleteParameters>
                                <InsertParameters>
                                    <asp:Parameter Name="phong" Type="String"></asp:Parameter>
                                    <asp:Parameter Name="diachi" Type="String"></asp:Parameter>
                                </InsertParameters>
                                <UpdateParameters>
                                    <asp:Parameter Name="phong" Type="String"></asp:Parameter>
                                    <asp:Parameter Name="diachi" Type="String"></asp:Parameter>
                                    <asp:Parameter Name="original_id" Type="Int32"></asp:Parameter>
                                    <asp:Parameter Name="original_phong" Type="String"></asp:Parameter>
                                    <asp:Parameter Name="original_diachi" Type="String"></asp:Parameter>
                                </UpdateParameters>
                            </asp:SqlDataSource>
                    <div class="" id="ql_hoidong" visible="false" runat="server">
                        <div class="card">
                            <div class="card-header card-header-tvu text-yellow-tvu text-center">
                                <b>Quản lý Hội đồng bảo vệ luận án</b>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-lg">
                                Danh sách hội đồng
                            </div>
                            <div class="col-lg-1">

                            </div>
                        </div>
                        <asp:Panel runat="server" DefaultButton="btn_them_HDBV">
                            <div class="row">
                                <div class="col-lg mt-2">
                                    <asp:TextBox runat="server" ID="txt_tenHDBV" CssClass="form-control" placeholder="Tên hội đồng" />
                                </div>
                                <div class="col-lg-2 mt-2">
                                    <asp:LinkButton Text="Thêm mới" ID="btn_them_HDBV" OnClick="btn_them_HDBV_Click" CssClass="btn btn-primary" runat="server" />
                                </div>
                            </div>
                        </asp:Panel>
                        <div class="row">
                            <div class="col-lg mt-2">
                                <asp:GridView ID="gv_dshoidong" CssClass="table table-sm table-bordered" runat="server" AutoGenerateColumns="False" DataKeyNames="id" DataSourceID="db_hoidongBV">
                                    <Columns>
                                        <asp:TemplateField ShowHeader="False" ItemStyle-Width="10%" ItemStyle-HorizontalAlign="Center">
                                            <EditItemTemplate>
                                                <asp:LinkButton runat="server" Text="Update" CommandName="Update" CausesValidation="True" ID="LinkButton1"></asp:LinkButton>&nbsp;<asp:LinkButton runat="server" Text="Cancel" CommandName="Cancel" CausesValidation="False" ID="LinkButton2"></asp:LinkButton>
                                            </EditItemTemplate>
                                            <ItemTemplate>
                                                <asp:LinkButton runat="server" Text="Edit" CommandName="Edit" CausesValidation="False" ID="LinkButton1"></asp:LinkButton>
                                            </ItemTemplate>
                                        </asp:TemplateField>

                                        <asp:BoundField DataField="id" HeaderText="id" ReadOnly="True" InsertVisible="False" SortExpression="id" Visible="False"></asp:BoundField>
                                        <asp:TemplateField HeaderText="Hội đồng" SortExpression="TenHD">
                                            <EditItemTemplate>
                                                <asp:TextBox runat="server" Text='<%# Bind("TenHD") %>' ID="TextBox1"></asp:TextBox>
                                            </EditItemTemplate>
                                            <ItemTemplate>
                                                <asp:LinkButton runat="server" Font-Underline="false" ToolTip='<%# Bind("id") %>' OnClick="btn_view_HD_Click"
                                                    Text='<%# Bind("TenHD") %>' ID="btn_view_HD"></asp:LinkButton>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField ItemStyle-Width="10%" ItemStyle-HorizontalAlign="Center">
                                            <ItemTemplate>
                                                <asp:LinkButton runat="server" Text="Delete" CommandName="Delete" CausesValidation="False" ID="LinkButton2"></asp:LinkButton>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                    </Columns>
                                </asp:GridView>
                                <asp:SqlDataSource runat="server" ID="db_hoidongBV" ConflictDetection="CompareAllValues" ConnectionString='<%$ ConnectionStrings:SDHConnectionString %>' DeleteCommand="DELETE FROM [HoiDong_BV] WHERE [id] = @original_id AND (([TenHD] = @original_TenHD) OR ([TenHD] IS NULL AND @original_TenHD IS NULL))" InsertCommand="INSERT INTO [HoiDong_BV] ([TenHD]) VALUES (@TenHD)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [HoiDong_BV]" UpdateCommand="UPDATE [HoiDong_BV] SET [TenHD] = @TenHD WHERE [id] = @original_id AND (([TenHD] = @original_TenHD) OR ([TenHD] IS NULL AND @original_TenHD IS NULL))">
                                    <DeleteParameters>
                                        <asp:Parameter Name="original_id" Type="Int32"></asp:Parameter>
                                        <asp:Parameter Name="original_TenHD" Type="String"></asp:Parameter>
                                    </DeleteParameters>
                                    <InsertParameters>
                                        <asp:Parameter Name="TenHD" Type="String"></asp:Parameter>
                                    </InsertParameters>
                                    <UpdateParameters>
                                        <asp:Parameter Name="TenHD" Type="String"></asp:Parameter>
                                        <asp:Parameter Name="original_id" Type="Int32"></asp:Parameter>
                                        <asp:Parameter Name="original_TenHD" Type="String"></asp:Parameter>
                                    </UpdateParameters>
                                </asp:SqlDataSource>
                            </div>
                        </div>
                        <hr class="bg-primary" />
                        <div id="div_qlhd" visible="false" runat="server">
                            <div class="row">
                                <div class="col-lg mt-2">
                                    <div class="card">
                                        <div class="card-body">
                                            <h2 class="text-center text-danger">
                                                <asp:Label Text="" ID="lb_title_HDBV" runat="server" /></h2>
                                            <asp:Panel runat="server" DefaultButton="btn_them_HD">
                                                Thời gian địa điểm
                                        <div class="row ">
                                            <div class="col-lg mt-2">
                                                <%--Ngày bảo vệ--%>
                                                <asp:TextBox runat="server" TextMode="Date" ID="txt_ngayHDBV" CssClass="form-control form-control-sm" />
                                            </div>
                                            <div class="col-lg mt-2">
                                                <%--Thời gian--%>
                                                <asp:TextBox runat="server" TextMode="Time" ID="txt_giobd" CssClass="form-control form-control-sm" />
                                            </div>
                                            <div class="col-lg mt-2">
                                                <%--Ngành--%>
                                                <asp:TextBox runat="server" TextMode="Time" ID="txt_giokt" CssClass="form-control form-control-sm" />

                                            </div>
                                            <div class="col-lg-4 mt-2">
                                                <%--Địa điểm--%>
                                                <div class="form-inline row">
                                                    <div class="col-lg">
                                                        <asp:DropDownList CssClass="select" ID="dr_room_HD" runat="server" DataSourceID="PhongHDBV" DataTextField="phong" DataValueField="id">
                                                        </asp:DropDownList>
                                                    </div>
                                                    <div class="col-lg-1">
                                                        <asp:LinkButton Text="" CssClass="fa fa-plus-circle " OnClientClick="openModal_phongbaove();" runat="server" />
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                                Đối tượng bảo vệ
                                        <div class="row">
                                            <div class="col-lg mt-2">
                                                <asp:TextBox runat="server" ID="txt_hoidongBV" CssClass="form-control form-control-sm" placeholder="Hội đồng" />
                                            </div>
                                            <div class="col-lg mt-2">
                                                <%--Tên đề tài--%>
                                                <asp:TextBox runat="server" ID="txt_detaiHDBV" required="true" CssClass="form-control form-control-sm" placeholder="Tên đề tài" />
                                            </div>

                                        </div>
                                                <div class="row">
                                                    <div class="col-lg mt-2">
                                                        <asp:DropDownList runat="server" ID="dr_nganh" CssClass="select">
                                                        </asp:DropDownList>
                                                    </div>
                                                    <div class="col-lg mt-2">
                                                        <asp:TextBox runat="server" placeholder="Ghi chú" ID="txt_ghichu_HDBV" CssClass="form-control form-control-sm" />
                                                    </div>
                                                    <div class="col-lg-2 mt-2">
                                                        <asp:Button Text="Thêm" OnClick="btn_them_HD_Click" ID="btn_them_HD" CssClass="btn btn-sm btn-primary" runat="server" />
                                                    </div>
                                                </div>
                                            </asp:Panel>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <hr class="bg-info" />
                            <div class="row">
                                <div class="col-lg mt-2">
                                    Năm bảo vệ
                                <asp:DropDownList runat="server" AutoPostBack="true" OnSelectedIndexChanged="dr_nam_HD_SelectedIndexChanged" ID="dr_nam_HD" CssClass="select">
                                </asp:DropDownList>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-lg mt-2">
                                    <asp:Label Text="Lịch hội đồng ....." CssClass="text-center mb-2" runat="server" />
                                    <div style="overflow:auto; max-height:70vh">
                                        <asp:ListView ID="lv_hoidongBV" OnItemEditing="lv_hoidongBV_ItemEditing" OnItemCanceling="lv_hoidongBV_ItemCanceling" 
                                            OnItemDataBound="lv_hoidongBV_ItemDataBound" OnItemUpdating="lv_hoidongBV_ItemUpdating"
                                            runat="server" ItemPlaceholderID="pl_">
                                            <LayoutTemplate>
                                                <table class="table table-sm table-bordered">
                                                    <tr>
                                                        <th></th>
                                                        <th>Nội dung</th>
                                                        <th></th>
                                                    </tr>
                                                    <asp:PlaceHolder runat="server" ID="pl_" />
                                                </table>
                                            </LayoutTemplate>
                                            <ItemTemplate>
                                                <tr>
                                                    <td>
                                                        <asp:LinkButton Text="Edit" ID="edit_hoidong" CommandName="Edit" runat="server" />
                                                    </td>
                                                    <td>
                                                        <div class="row">
                                                            <div class="col-lg">
                                                                <asp:Label Text="" ID="nd1" runat="server" />
                                                            </div>
                                                            <div class="col-lg">
                                                                <asp:Label Text="" ID="nd2" runat="server" />
                                                            </div>
                                                        </div>
                                                    </td>
                                                    <td>
                                                        <asp:LinkButton Text="Delete" ID="delete_hoidong" OnClick="delete_hoidong_Click" CommandArgument='<%# Eval("id") %>' runat="server" />
                                                    </td>
                                                </tr>
                                            </ItemTemplate>
                                            <EditItemTemplate>
                                                <tr>
                                                    <td>
                                                        <asp:LinkButton Text="Update" CommandName="Update" ID="btn_update" CommandArgument='<%# Eval("id") %>' runat="server" />
                                                    </td>
                                                    <td>
                                                         <div class="row">
                                                             <div class="col-lg">
                                                                 <asp:DropDownList runat="server" CssClass="select" ID="dr_sua_nganh">
                                                                 </asp:DropDownList>
                                                                 <asp:TextBox runat="server" ID="txt_suaHoiDongBV" placeholder="Hội đồng" CssClass="form-control form-control-sm mt-2 mb-2" />
                                                                 
                                                                 <asp:TextBox runat="server" ID="txt_suadetai_HDBV" placeholder="Đề tài" CssClass="form-control form-control-sm mt-2" />
                                                             </div>
                                                             <div class="col-lg">
                                                                 <div class="row">
                                                                     <div class="col-lg-4">
                                                                         <asp:TextBox runat="server" ID="txt_ngay_HDBV" TextMode="Date" CssClass="form-control form-control-sm mt-2 mb-2" />
                                                                     </div>
                                                                     <div class="col-lg " style="display:flex">
                                                                         <asp:TextBox runat="server" ID="txt_suagiobd" TextMode="Time" placeholder="Đề tài" CssClass="form-control form-control-sm mt-2" />
                                                                         <asp:TextBox runat="server" ID="txt_suagiokt" TextMode="Time" placeholder="Đề tài" CssClass="form-control form-control-sm mt-2" />
                                                                     </div>
                                                                 </div>
                                                                 <asp:DropDownList runat="server" CssClass="select" ID="dr_sua_phongHDBV">
                                                                 </asp:DropDownList>
                                                                 <asp:TextBox runat="server" ID="txt_suagghichu" placeholder="Ghi chú" CssClass="form-control form-control-sm mt-2" />
                                                             </div>
                                                         </div>
                                                    </td>
                                                    <td>
                                                        <asp:LinkButton Text="Cancel" CommandName="Cancel" runat="server" />
                                                    </td>
                                                </tr>
                                            </EditItemTemplate>
                                        </asp:ListView>
                                    </div>

                                </div>
                            </div>
                        </div>

                    </div>
                            
                        </ContentTemplate>
                    </asp:UpdatePanel>
                    <asp:UpdatePanel runat="server">
                        <ContentTemplate>
                            <div class="" id="ql_video" visible="false" runat="server">
                                <div class="card">
                                    <div class="card-header card-header-tvu text-yellow-tvu text-center">
                                        <b>Quản lý Video giới thiệu</b>
                                    </div>
                                </div>
                               
                                <div class="row">
                                    <div class="col-lg">

                                    <asp:GridView runat="server" ID="gv_link_video" AutoGenerateColumns="false"  ShowFooter="true" CssClass="table table-sm table-bordered">
                                        <Columns>
                                            <asp:TemplateField ItemStyle-VerticalAlign="Middle" ItemStyle-HorizontalAlign="Center">
                                                <ItemTemplate>
                                                    <asp:LinkButton runat="server" CommandArgument='<%# Eval("id") %>' CssClass="fas fa-trash-alt" OnClick="btn_delete_video_Click" ForeColor="Red" Font-Underline="false" ID="btn_delete_video"></asp:LinkButton>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Link nhúng video">
                                                <ItemTemplate>
                                                    <asp:Label Text='<%# Eval("id") %>' Visible="false" runat="server" />
                                                    <asp:TextBox runat="server" Text='<%# Eval("href") %>' ToolTip='<%# Eval("id") %>' AutoPostBack="true" ID="txt_link_video" OnTextChanged="txt_link_video_TextChanged"
                                                        placeholder="Nội dung hiển thị nếu có" CssClass="form-control" />
                                                </ItemTemplate>
                                                <FooterTemplate>
                                                    <asp:TextBox runat="server" ID="txt_ftlink_video" placeholder="Nội dung hiển thị nếu có" CssClass="form-control" />
                                                </FooterTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Show" ItemStyle-VerticalAlign="Middle" ItemStyle-HorizontalAlign="Center">
                                                <FooterTemplate>
                                                    <asp:Button Text="Thêm" ID="btn_luu_linkvideo" CssClass="btn btn-primary btn-sm" runat="server" OnClick="btn_luu_linkvideo_Click" />
                                                </FooterTemplate>
                                                <ItemTemplate>
                                                    <asp:CheckBox runat="server" OnCheckedChanged="Label1_CheckedChanged" AutoPostBack="true" ToolTip='<%# Eval("id") %>' Checked='<%# Eval("show")!=null?Eval("show"):false %>' ID="Label1"></asp:CheckBox>
                                                </ItemTemplate>
                                            </asp:TemplateField>

                                        </Columns>
                                    </asp:GridView>
                                    </div>
                                   
                                </div>
                            </div>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                <%--slide--%>
                <asp:UpdatePanel runat="server">
                    <ContentTemplate>
                        <div class="" id="ql_slide" visible="false" runat="server">
                            <div class="card">
                                <div class="card-header card-header-tvu text-yellow-tvu text-center">
                                    <b>Quản lý SLIDE</b>
                                </div>
                            </div>
                            
                            <div class="row">
                                <div class="col-lg-6 mt-2">
                                    <asp:TextBox runat="server" ID="txt_slide_nd" placeholder="Nội dung hiển thị nếu có" CssClass="form-control" />
                                </div>
                                <div class="col-lg-6 mt-2">
                                    <asp:TextBox runat="server" ID="txt_href" placeholder="Địa chỉ url nếu có" CssClass="form-control" />
                                </div>
                                <div class="col-lg mt-2">
                                    <div class="custom-file">
                                        <asp:FileUpload ID="file_img" runat="server" accept=".jpg, .jpeg, .png, .gif" />
                                    </div>
                                </div>
                                <div class="col-lg mt-2">
                                    <asp:Button Text="Lưu" ID="btn_luu_slide" CssClass="btn btn-primary btn-sm" runat="server" OnClick="btn_luu_slide_Click" />
                                </div>
                            </div>
                            <asp:GridView ID="gv_slide" runat="server" AutoGenerateColumns="false" CssClass="table table-sm table-bordered mt-2" OnRowDataBound="gv_slide_RowDataBound"
                                OnRowUpdating="gv_slide_RowUpdating" OnRowDeleting="gv_slide_RowDeleting">
                                <Columns>
                                    <asp:TemplateField HeaderText="STT" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center">
                                        <ItemTemplate>
                                            <%# Container.DataItemIndex + 1 %>
                                            <asp:Label Text='<%# Eval("id") %>' ID="lb_id" Visible="false" runat="server" />
                                        </ItemTemplate>
                                        <ItemStyle HorizontalAlign="Center" />
                                    </asp:TemplateField>
                                    <asp:TemplateField ItemStyle-HorizontalAlign="Center">
                                        <ItemTemplate>
                                            <asp:LinkButton Font-Underline="false" CommandName="Delete" ToolTip="Remove" CssClass="far fa-trash-alt text-danger" runat="server" />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Slide">
                                        <ItemTemplate>
                                            <asp:TextBox CssClass="form-control" AutoPostBack="true" OnTextChanged="txt_slide_TextChanged" runat="server" Text='<%# Eval("slide") %>' ID="txt_slide"></asp:TextBox>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Hiển thị" ItemStyle-VerticalAlign="Middle" ItemStyle-HorizontalAlign="Center">
                                        <ItemTemplate>
                                            <asp:CheckBox runat="server" AutoPostBack="true" OnCheckedChanged="cb_show_CheckedChanged" Checked='<%# Eval("show") %>' ID="cb_show"></asp:CheckBox>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Href">
                                        <ItemTemplate>
                                            <asp:TextBox CssClass="form-control" AutoPostBack="true" OnTextChanged="txt_href_TextChanged" runat="server" Text='<%# Eval("href") %>' ID="txt_href"></asp:TextBox>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Ảnh">
                                        <ItemTemplate>
                                            <asp:Image ID="img_anh" Style="max-height: 150px" runat="server" />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                </Columns>
                                <HeaderStyle CssClass="text-center" />
                            </asp:GridView>
                        </div>
                    </ContentTemplate>
                    <Triggers>
                        <asp:PostBackTrigger ControlID="btn_luu_slide" />
                    </Triggers>
                </asp:UpdatePanel>
                <%--Thông báo--%>
                <asp:UpdatePanel runat="server">
                    <ContentTemplate>
                        <div class="" visible="false" runat="server" id="ql_tb">
                            <div class="card">
                                <div class="card-header card-header-tvu text-yellow-tvu text-center">
                                    <b>Quản lý Thông báo</b>
                                </div>
                            </div>

                                <div class="row">
                                    <div class="col">
                                        <asp:TextBox runat="server" ID="txt_header_tb" CssClass="form-control" placeholder="Tiêu đề" />
                                    </div>
                                    <div class="col-lg">
                                        <asp:TextBox runat="server" CssClass="form-control " placeholder="URL" ID="url_tb" />

                                    </div>
                                </div>
                                <div class="row mt-2">
                                    <div class="col">
                                        <div class="input-group">
                                            <div class="input-group-prepend">
                                                <span class="input-group-text">Icon</span>
                                            </div>
                                            <asp:FileUpload ID="file_icon_TB" accept=".jpg, .jpeg, .png, .gif" CssClass="form-control h-auto" runat="server" AllowMultiple="true" />
                                        </div>

                                    </div>
                                    <div class="col-lg">
                                        <div class="row">
                                            <div class="col-lg ">
                                                <div class="input-group">
                                                    <div class="input-group-prepend">
                                                        <span class="input-group-text">File</span>
                                                    </div>
                                                    <asp:FileUpload ID="file_tb" accept=".jpg, .jpeg, .png, .gif" CssClass="form-control h-auto" runat="server" AllowMultiple="true" />
                                                </div>
                                                <asp:LinkButton ID="LinkButton3" OnClick="btn_open_modal_file_Click"
                                                    CommandArgument="thongbao" Text="File Sever"
                                                    CssClass="btn btn-primary mt-1" runat="server" />
                                            </div>
                                        </div>

                                    </div>
                                </div>
                            <div class="row mt-2">
                                <div class="col-lg">
                                    <asp:ListView ID="lv_thongbao_choosed" OnItemDataBound="lv_choosed_ItemDataBound" ItemPlaceholderID="pl_data" runat="server">
                                        <LayoutTemplate>
                                            <table class="table table-sm">
                                                <asp:PlaceHolder runat="server" ID="pl_data" />
                                            </table>
                                        </LayoutTemplate>
                                        <ItemTemplate>
                                            <tr class="row">
                                                <td class="col-lg">
                                                    <div class="text-break" style="display: flex">
                                                        <asp:LinkButton ID="btn_remove_choosed"
                                                            OnClick="btn_remove_choosed_Click" Text=""
                                                            CommandArgument='<%# Eval("FullPath") %>' CssClass="mr-2 far fa-trash-alt text-danger" runat="server" />
                                                        <asp:LinkButton ID="btn_file_chon" Enabled="false" CommandArgument='<%# Eval("FullPath") %>'
                                                            Text='<%# Eval("fileName") %>' runat="server" />
                                                    </div>
                                                </td>
                                            </tr>
                                        </ItemTemplate>
                                    </asp:ListView>
                                </div>
                            </div>
                            <hr />
                            <div class="row">
                                <div class="col">
                                    <asp:HiddenField runat="server" ID="pl_summer" />
                                    <textarea id="note_tb" class="summernote"></textarea>
                                    <asp:Button Text="Lưu bài" OnClientClick="return read_summernote_tb();" CssClass="btn btn-primary mt-2" ID="btn_save_tb" runat="server" OnClick="btn_save_bv_Click" />
                                    <asp:LinkButton Text="Hủy sửa bài" ID="btn_huysua_TB" CommandArgument="TB"
                                        OnClick="huysuabai_Click" CssClass="btn btn-danger mt-2" Visible="false" runat="server" />
                                </div>
                            </div>

                            <asp:GridView ID="gv_tb" CssClass="table table-sm table-bordered mt-2" PageSize="15" AutoGenerateColumns="false" runat="server" OnRowDeleting="gv_tb_RowDeleting"
                                OnSelectedIndexChanging="gv_tb_SelectedIndexChanging" OnRowUpdating="gv_tb_RowUpdating" OnPageIndexChanging="gv_tb_PageIndexChanging">
                                <Columns>
                                    <asp:TemplateField HeaderText="STT" ItemStyle-HorizontalAlign="Center">
                                        <ItemTemplate>
                                            <%# Container.DataItemIndex + 1 %>
                                            <asp:Label Text='<%# Eval("id") %>' ID="lb_id" Visible="false" runat="server" />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField>
                                        <ItemTemplate>
                                            <asp:LinkButton Font-Underline="false" CommandName="Delete" ToolTip="Remove" CssClass="far fa-trash-alt text-danger" runat="server" />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Tiêu đề">
                                        <ItemTemplate>
                                            <asp:LinkButton Font-Underline="false" OnClick="Label1_Click" CommandArgument='<%# Eval("id") %>' CssClass="linkbutton" Text='<%# Eval("header") %>' runat="server" />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="SHOW" ItemStyle-VerticalAlign="Middle" ItemStyle-HorizontalAlign="Center">
                                        <ItemTemplate>
                                            <asp:CheckBox runat="server" AutoPostBack="true" OnCheckedChanged="cb_show_tb_CheckedChanged" Checked='<%# Eval("show") %>' ID="cb_show_tb"></asp:CheckBox>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Ưu tiên">
                                        <ItemTemplate>
                                            <asp:TextBox runat="server" ID="txt_uutien" min="1" max="5" AutoPostBack="true" OnTextChanged="txt_uutien_TextChanged" TextMode="Number" Text='<%# Eval("uutien") %>' CssClass="form-control" />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Ngày viết">
                                        <ItemTemplate>
                                            <asp:Label Text='<%# Eval("ngaytao") %>' runat="server" />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="HOT">
                                        <ItemTemplate>
                                            <asp:CheckBox Checked='<%# Eval("show_new")!=null?Eval("show_new"):false %>' ID="cb_show_new" OnCheckedChanged="cb_show_tb_CheckedChanged" runat="server" />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                </Columns>
                            </asp:GridView>

                        </div>
                    </ContentTemplate>
                    <Triggers>
                        <asp:PostBackTrigger ControlID="btn_save_tb" />
                    </Triggers>
                </asp:UpdatePanel>

                <%--Tin tức--%>
                <asp:UpdatePanel runat="server">
                    <ContentTemplate>
                        <div class="" runat="server" visible="false" id="ql_tt">
                            <div class="card">
                                <div class="card-header card-header-tvu text-yellow-tvu text-center">
                                    <b>Quản lý Tin tức</b>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col">
                                    <asp:TextBox runat="server" ID="txt_header_tt" CssClass="form-control" placeholder="Tiêu đề" />
                                </div>
                                <div class="col">
                                    <asp:TextBox runat="server" CssClass="form-control " placeholder="URL" ID="txt_url_tt" />
                                    
                                </div>
                            </div>
                            <div class="row mt-2">
                                <div class="col">
                                    <div class="input-group">
                                        <div class="input-group-prepend">
                                            <span class="input-group-text">Icon</span>
                                        </div>
                                        <asp:FileUpload AllowMultiple="true" CssClass="form-control h-auto" ID="file_icon_tintuc" accept=".jpg, .jpeg, .png, .gif" runat="server" />
                                    </div>
                                </div>
                                <div class="col-lg">
                                    <div class="input-group">
                                        <div class="input-group-prepend">
                                            <span class="input-group-text">File</span>
                                        </div>
                                        <asp:FileUpload AllowMultiple="true" CssClass="form-control h-auto" ID="file_up_tt" accept=".pdf" runat="server" />
                                    </div>
                                    <asp:LinkButton ID="LinkButton4" OnClick="btn_open_modal_file_Click"
                                        CommandArgument="tintuc" Text="Chọn File Sever"
                                        CssClass="btn btn-primary" runat="server" />
                                </div>
                            </div>
                            <div class="row mt-2">
                                <div class="col-lg">
                                    <asp:ListView ID="lv_tintuc_choosed" OnItemDataBound="lv_choosed_ItemDataBound" ItemPlaceholderID="pl_data" runat="server">
                                        <LayoutTemplate>
                                            <table class="table table-sm">
                                                <asp:PlaceHolder runat="server" ID="pl_data" />
                                            </table>
                                        </LayoutTemplate>
                                        <ItemTemplate>
                                            <tr class="row">
                                                <td class="col-lg">
                                                    <div class="text-break" style="display: flex">
                                                        <asp:LinkButton ID="btn_remove_choosed"
                                                            OnClick="btn_remove_choosed_Click" Text=""
                                                            CommandArgument='<%# Eval("FullPath") %>' CssClass="mr-2 far fa-trash-alt text-danger" runat="server" />
                                                        <asp:LinkButton ID="btn_file_chon" Enabled="false" CommandArgument='<%# Eval("FullPath") %>'
                                                            Text='<%# Eval("fileName") %>' runat="server" />
                                                    </div>
                                                </td>
                                            </tr>
                                        </ItemTemplate>
                                    </asp:ListView>
                                </div>
                            </div>
                            <hr />
                            <div class="row">
                                <div class="col">
                                    <asp:HiddenField runat="server" ID="hd_tt" />
                                    <textarea id="note_tt" class="summernote"></textarea>
                                    <asp:Button Text="Lưu bài" OnClientClick="return read_summernote_tt();" CssClass="btn btn-primary mt-2" ID="btn_luu_tt" runat="server" OnClick="btn_save_bv_Click" />
                                    <asp:LinkButton Text="Hủy sửa bài" CommandArgument="TT" ID="btn_huysua_tt" OnClick="huysuabai_Click" CssClass="btn btn-danger mt-2" Visible="false" runat="server" />
                                </div>
                            </div>
                            <asp:GridView ID="gv_tt" CssClass="table table-sm table-bordered mt-2" PageSize="15" AutoGenerateColumns="false" runat="server" OnPageIndexChanging="gv_tt_PageIndexChanging"
                                OnRowDeleting="gv_tt_RowDeleting" OnRowUpdating="gv_tt_RowUpdating" OnSelectedIndexChanging="gv_tt_SelectedIndexChanging">
                                <Columns>
                                    <asp:TemplateField HeaderText="STT" ItemStyle-HorizontalAlign="Center">
                                        <ItemTemplate>
                                            <%# Container.DataItemIndex + 1 %>
                                            <asp:Label Text='<%# Eval("id") %>' ID="lb_id" Visible="false" runat="server" />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField>
                                        <ItemTemplate>
                                            <asp:LinkButton Font-Underline="false" CommandName="Delete" ToolTip="Remove" CssClass="far fa-trash-alt text-danger" runat="server" />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Tiêu đề">
                                        <ItemTemplate>
                                            <asp:LinkButton Font-Underline="false" OnClick="Label1_Click" CommandArgument='<%# Eval("id") %>' CssClass="linkbutton" Text='<%# Eval("header") %>' runat="server" />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="SHOW" ItemStyle-VerticalAlign="Middle" ItemStyle-HorizontalAlign="Center">
                                        <ItemTemplate>
                                            <asp:CheckBox runat="server" AutoPostBack="true" OnCheckedChanged="cb_show_tb_CheckedChanged1" Checked='<%# Eval("show") %>' ID="cb_show_tb"></asp:CheckBox>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Ưu tiên">
                                        <ItemTemplate>
                                            <asp:TextBox runat="server" ID="txt_uutien" min="1" max="5" OnTextChanged="txt_uutien_TextChanged1" AutoPostBack="true" TextMode="Number" Text='<%# Eval("uutien") %>' CssClass="form-control" />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Ngày viết">
                                        <ItemTemplate>
                                            <asp:Label Text='<%# Eval("ngaytao") %>' runat="server" />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="HOT">
                                        <ItemTemplate>
                                            <asp:CheckBox Checked='<%# Eval("show_new")!=null?Eval("show_new"):false %>' ID="cb_show_new" OnCheckedChanged="cb_show_tb_CheckedChanged1" runat="server" />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                </Columns>
                            </asp:GridView>
                        </div>
                    </ContentTemplate>
                    <Triggers>
                        <asp:PostBackTrigger ControlID="btn_luu_tt" />
                    </Triggers>
                </asp:UpdatePanel>

                <%--Tuyển sinh--%>
                <asp:UpdatePanel runat="server">
                    <ContentTemplate>
                        <div class="" runat="server" visible="false" id="ql_ts">
                            <div class="card">
                                <div class="card-header card-header-tvu text-yellow-tvu text-center">
                                    <b>Quản lý Thông tin Tuyển sinh</b>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col">
                                    <asp:TextBox runat="server" required="true" ID="txt_header_ts" CssClass="form-control" placeholder="Tiêu đề" />
                                </div>
                                <div class="col">
                                    <asp:TextBox runat="server" CssClass="form-control " placeholder="URL" ID="txt_url_ts" />
                                </div>
                            </div>
                            <div class="row mt-2">
                                <div class="col">
                                    <div class="input-group">
                                        <div class="input-group-prepend">
                                            <span class="input-group-text">Icon</span>
                                        </div>
                                        <asp:FileUpload ID="file_icon_TS" CssClass="form-control h-auto" AllowMultiple="true" accept=".jpg, .jpeg, .png, .gif" runat="server" />
                                    </div>
                                </div>
                                <div class="col-lg">
                                    <div class="input-group">
                                        <div class="input-group-prepend">
                                            <span class="input-group-text">File</span>
                                        </div>
                                        <asp:FileUpload ID="file_ts" CssClass="form-control h-auto" AllowMultiple="true" accept=".pdf" runat="server" />
                                    </div>
                                    <asp:LinkButton ID="LinkButton5" OnClick="btn_open_modal_file_Click"
                                        CommandArgument="tuyensinh" Text="Chọn File Sever"
                                        CssClass="btn btn-primary" runat="server" />
                                </div>
                            </div>
                            <div class="row mt-2">
                                <div class="col-lg">
                                    <asp:ListView ID="lv_tuyensinh_choosed" OnItemDataBound="lv_choosed_ItemDataBound" ItemPlaceholderID="pl_data" runat="server">
                                        <LayoutTemplate>
                                            <table class="table table-sm">
                                                <asp:PlaceHolder runat="server" ID="pl_data" />
                                            </table>
                                        </LayoutTemplate>
                                        <ItemTemplate>
                                            <tr class="row">
                                                <td class="col-lg">
                                                    <div class="text-break" style="display: flex">
                                                        <asp:LinkButton ID="btn_remove_choosed"
                                                            OnClick="btn_remove_choosed_Click" Text=""
                                                            CommandArgument='<%# Eval("FullPath") %>' CssClass="mr-2 far fa-trash-alt text-danger" runat="server" />
                                                        <asp:LinkButton ID="btn_file_chon" Enabled="false" CommandArgument='<%# Eval("FullPath") %>'
                                                            Text='<%# Eval("fileName") %>' runat="server" />
                                                    </div>
                                                </td>
                                            </tr>
                                        </ItemTemplate>
                                    </asp:ListView>
                                </div>
                            </div>
                            <hr />
                            <div class="row">
                                <div class="col">
                                    <asp:HiddenField runat="server" ID="hd_ts" />
                                    <textarea id="note_ts" class="summernote"></textarea>
                                    <asp:Button Text="Lưu bài" OnClientClick="return read_summernote_ts();" CssClass="btn btn-primary mt-2" ID="btn_luu_ts" runat="server" OnClick="btn_save_bv_Click" />
                                    <asp:LinkButton Text="Hủy sửa bài" CommandArgument="TS" ID="btn_huysua_ts" OnClick="huysuabai_Click" CssClass="btn btn-danger mt-2" Visible="false" runat="server" />
                                </div>
                            </div>
                            <asp:GridView ID="gv_ts" CssClass="table table-sm table-bordered mt-2" PageSize="15" AutoGenerateColumns="false" runat="server" OnPageIndexChanging="gv_ts_PageIndexChanging"
                                OnRowDeleting="gv_ts_RowDeleting" OnRowUpdating="gv_ts_RowUpdating" OnSelectedIndexChanging="gv_ts_SelectedIndexChanging">
                                <Columns>
                                    <asp:TemplateField HeaderText="STT" ItemStyle-HorizontalAlign="Center">
                                        <ItemTemplate>
                                            <%# Container.DataItemIndex + 1 %>
                                            <asp:Label Text='<%# Eval("id") %>' ID="lb_id" Visible="false" runat="server" />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField>
                                        <ItemTemplate>
                                            <asp:LinkButton Font-Underline="false" CommandName="Delete" ToolTip="Remove" CssClass="far fa-trash-alt text-danger" runat="server" />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Tiêu đề">
                                        <ItemTemplate>
                                            <asp:LinkButton Font-Underline="false" OnClick="Label1_Click" CommandArgument='<%# Eval("id") %>' CssClass="linkbutton" Text='<%# Eval("header") %>' runat="server" />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="SHOW" ItemStyle-VerticalAlign="Middle" ItemStyle-HorizontalAlign="Center">
                                        <ItemTemplate>
                                            <asp:CheckBox runat="server" AutoPostBack="true" OnCheckedChanged="cb_show_tb_CheckedChanged2" Checked='<%# Eval("show") %>' ID="cb_show_tb"></asp:CheckBox>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Ưu tiên">
                                        <ItemTemplate>
                                            <asp:TextBox runat="server" CssClass="form-control form-control-sm" ID="txt_uutien" min="1" max="5" OnTextChanged="txt_uutien_TextChanged2" AutoPostBack="true" TextMode="Number" Text='<%# Eval("uutien") %>' />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Ngày viết">
                                        <ItemTemplate>
                                            <asp:Label Text='<%# Eval("ngaytao") %>' runat="server" />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="HOT">
                                        <ItemTemplate>
                                            <asp:CheckBox Checked='<%# Eval("show_new")!=null?Eval("show_new"):false %>' ID="cb_show_new" OnCheckedChanged="cb_show_tb_CheckedChanged2" runat="server" />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                </Columns>
                            </asp:GridView>
                        </div>
                    </ContentTemplate>
                    <Triggers>
                        <asp:PostBackTrigger ControlID="btn_luu_ts" />
                    </Triggers>
                </asp:UpdatePanel>

                <%--NCS--%>
                <asp:UpdatePanel runat="server">
                    <ContentTemplate>
                        <div class="" runat="server" visible="false" id="div_ncs">
                            <div class="card">
    <div class="card-header card-header-tvu text-yellow-tvu text-center">
        <b>Quản lý Nghiên cứu sinh</b>
    </div>
</div>
                           
                            <div class="row">
                                <div class="col">
                                    <asp:TextBox runat="server" required="true" ID="TXT_HEADER_NCS" CssClass="form-control" placeholder="Tiêu đề" />
                                </div>
                                <div class="col">
                                    <asp:TextBox runat="server" CssClass="form-control " placeholder="URL" ID="TXT_LINK_NCS" />
                                </div>
                            </div>
                            <div class="row mt-2">
                                <div class="col">
                                    <div class="input-group">
                                        <div class="input-group-prepend">
                                            <span class="input-group-text">Icon</span>
                                        </div>
                                        <asp:FileUpload ID="file_icon_NCS" CssClass="form-control h-auto" AllowMultiple="true" accept=".jpg, .jpeg, .png, .gif" runat="server" />
                                    </div>
                                </div>
                                <div class="col-lg">
                                    <div class="input-group">
                                        <div class="input-group-prepend">
                                            <span class="input-group-text">File</span>
                                        </div>
                                        <asp:FileUpload ID="FILE_NCS" CssClass="form-control h-auto" AllowMultiple="true" accept=".pdf" runat="server" />
                                    </div>
                                    <asp:LinkButton ID="LinkButton6" OnClick="btn_open_modal_file_Click"
                                        CommandArgument="ncs" Text="Chọn File Sever"
                                        CssClass="btn btn-primary" runat="server" />
                                </div>
                            </div>
                            <div class="row mt-2">
                                <div class="col-lg">
                                    <asp:ListView ID="lv_ncs_choosed" OnItemDataBound="lv_choosed_ItemDataBound" ItemPlaceholderID="pl_data" runat="server">
                                        <LayoutTemplate>
                                            <table class="table table-sm">
                                                <asp:PlaceHolder runat="server" ID="pl_data" />
                                            </table>
                                        </LayoutTemplate>
                                        <ItemTemplate>
                                            >
                                                    <tr class="row">
                                                        <td class="col-lg">
                                                            <div class="text-break" style="display: flex">
                                                                <asp:LinkButton ID="btn_remove_choosed"
                                                                    OnClick="btn_remove_choosed_Click" Text=""
                                                                    CommandArgument='<%# Eval("FullPath") %>' CssClass="mr-2 far fa-trash-alt text-danger" runat="server" />
                                                                <asp:LinkButton ID="btn_file_chon" Enabled="false" CommandArgument='<%# Eval("FullPath") %>'
                                                                    Text='<%# Eval("fileName") %>' runat="server" />
                                                            </div>
                                                        </td>
                                                    </tr>
                                        </ItemTemplate>
                                    </asp:ListView>
                                </div>
                            </div>

                            <hr />
                            <div class="row">
                                <div class="col">
                                    <asp:HiddenField runat="server" ID="HD_NCS" />
                                    <textarea id="note_ncs" class="summernote"></textarea>
                                    <asp:Button OnClientClick="return read_summernote_NCS();" ID="btn_luu_NCS" OnClick="btn_save_bv_Click" runat="server" Text="Lưu bài" CssClass="btn btn-primary mt-2" />
                                    <asp:LinkButton Text="Hủy sửa bài" CommandArgument="NCS" ID="btn_huysua_ncs" OnClick="huysuabai_Click" CssClass="btn btn-danger mt-2" Visible="false" runat="server" />
                                </div>
                            </div>
                            <asp:GridView ID="gv_ncs" CssClass="table table-sm table-bordered mt-2" PageSize="15" AutoGenerateColumns="false" runat="server"
                                OnPageIndexChanging="gv_ts_PageIndexChanging"
                                OnRowDeleting="gv_ncs_RowDeleting" OnRowUpdating="gv_ncs_RowUpdating">
                                <Columns>
                                    <asp:TemplateField HeaderText="STT" ItemStyle-HorizontalAlign="Center">
                                        <ItemTemplate>
                                            <%# Container.DataItemIndex + 1 %>
                                            <asp:Label Text='<%# Eval("id") %>' ID="lb_id" Visible="false" runat="server" />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField>
                                        <ItemTemplate>
                                            <asp:LinkButton Font-Underline="false" CommandName="Delete" ToolTip="Remove" CssClass="far fa-trash-alt text-danger" runat="server" />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Tiêu đề">
                                        <ItemTemplate>
                                            <asp:LinkButton Font-Underline="false" OnClick="Label1_Click" CommandArgument='<%# Eval("id") %>' CssClass="linkbutton" Text='<%# Eval("header") %>' runat="server" />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="SHOW" ItemStyle-VerticalAlign="Middle" ItemStyle-HorizontalAlign="Center">
                                        <ItemTemplate>
                                            <asp:CheckBox runat="server" AutoPostBack="true" OnCheckedChanged="cb_show_NCS_CheckedChanged2" Checked='<%# Eval("show") %>' ID="cb_show_NCS"></asp:CheckBox>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Ưu tiên">
                                        <ItemTemplate>
                                            <asp:TextBox runat="server" CssClass="form-control form-control-sm" ID="txt_uutien" min="1" max="5" OnTextChanged="txt_uutien_NCS_TextChanged2" AutoPostBack="true" TextMode="Number" Text='<%# Eval("uutien") %>' />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Ngày viết">
                                        <ItemTemplate>
                                            <asp:Label Text='<%# Eval("ngaytao") %>' runat="server" />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="HOT">
                                        <ItemTemplate>
                                            <asp:CheckBox Checked='<%# Eval("show_new")!=null?Eval("show_new"):false %>' ID="cb_show_new" OnCheckedChanged="cb_show_NCS_CheckedChanged2" runat="server" />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                </Columns>
                            </asp:GridView>
                        </div>
                    </ContentTemplate>
                    <Triggers>
                        <asp:PostBackTrigger ControlID="btn_luu_NCS" />
                    </Triggers>
                </asp:UpdatePanel>

                <%--Cao học--%>
                <asp:UpdatePanel runat="server">
                    <ContentTemplate>
                        <div class="" runat="server" visible="false" id="div_caohoc">
                            <div class="card">
                                <div class="card-header card-header-tvu text-yellow-tvu text-center">
                                    <b>Quản lý Cao học</b>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col">
                                    <asp:TextBox runat="server" required="true" ID="txt_header_cahoc" CssClass="form-control" placeholder="Tiêu đề" />
                                </div>
                                <div class="col">
                                    <asp:TextBox runat="server" CssClass="form-control " placeholder="URL" ID="txt_link_caohoc" />
                                </div>
                            </div>
                            <div class="row mt-2">
                                <div class="col">
                                    <div class="input-group">
                                        <div class="input-group-prepend">
                                            <span class="input-group-text">Icon</span>
                                        </div>
                                        <asp:FileUpload ID="file_icon_CH" CssClass="form-control h-auto" AllowMultiple="true" accept=".jpg, .jpeg, .png, .gif" runat="server" />
                                    </div>
                                </div>
                                <div class="col-lg">
                                    <div class="input-group">
                                        <div class="input-group-prepend">
                                            <span class="input-group-text">File</span>
                                        </div>
                                        <asp:FileUpload ID="file_caohoc" CssClass="form-control h-auto" AllowMultiple="true" accept=".pdf" runat="server" />
                                    </div>
                                    <asp:LinkButton ID="LinkButton7" OnClick="btn_open_modal_file_Click"
                                        CommandArgument="caohoc" Text="Chọn File Sever"
                                        CssClass="btn btn-primary" runat="server" />
                                </div>
                            </div>
                            <div class="row mt-2">
                                <div class="col-lg">
                                    <asp:ListView ID="lv_caohoc_choosed" OnItemDataBound="lv_choosed_ItemDataBound" ItemPlaceholderID="pl_data" runat="server">
                                        <LayoutTemplate>
                                            <table class="table table-sm">
                                                <asp:PlaceHolder runat="server" ID="pl_data" />
                                            </table>
                                        </LayoutTemplate>
                                        <ItemTemplate>
                                            <tr class="row">
                                                <td class="col-lg">
                                                    <div class="text-break" style="display: flex">
                                                        <asp:LinkButton ID="btn_remove_choosed"
                                                            OnClick="btn_remove_choosed_Click" Text=""
                                                            CommandArgument='<%# Eval("FullPath") %>' CssClass="mr-2 far fa-trash-alt text-danger" runat="server" />
                                                        <asp:LinkButton ID="btn_file_chon" Enabled="false" CommandArgument='<%# Eval("FullPath") %>'
                                                            Text='<%# Eval("fileName") %>' runat="server" />
                                                    </div>
                                                </td>
                                            </tr>
                                        </ItemTemplate>
                                    </asp:ListView>
                                </div>
                            </div>

                            <hr />
                            <div class="row">
                                <div class="col">
                                    <asp:HiddenField runat="server" ID="hd_caohoc" />
                                    <textarea id="note_caohoc" class="summernote"></textarea>
                                    <asp:Button OnClientClick="return read_summernote_caohoc();" ID="btn_luu_caohoc" OnClick="btn_save_bv_Click" runat="server" Text="Lưu bài" CssClass="btn btn-primary mt-2" />
                                    <asp:LinkButton Text="Hủy sửa bài" CommandArgument="CH" ID="btn_huysua_ch" OnClick="huysuabai_Click" CssClass="btn btn-danger mt-2" Visible="false" runat="server" />
                                </div>
                            </div>
                            <asp:GridView ID="GV_CAOHOC" CssClass="table table-sm table-bordered mt-2" PageSize="15" AutoGenerateColumns="false" runat="server"
                                OnPageIndexChanging="gv_CAOHOC_PageIndexChanging"
                                OnRowDeleting="gv_CAOHOC_RowDeleting" OnRowUpdating="GV_CAOHOC_RowUpdating">
                                <Columns>
                                    <asp:TemplateField HeaderText="STT" ItemStyle-HorizontalAlign="Center">
                                        <ItemTemplate>
                                            <%# Container.DataItemIndex + 1 %>
                                            <asp:Label Text='<%# Eval("id") %>' ID="lb_id" Visible="false" runat="server" />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField>
                                        <ItemTemplate>
                                            <asp:LinkButton Font-Underline="false" CommandName="Delete" ToolTip="Remove" CssClass="far fa-trash-alt text-danger" runat="server" />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Tiêu đề">
                                        <ItemTemplate>
                                            <asp:LinkButton Font-Underline="false" OnClick="Label1_Click" CommandArgument='<%# Eval("id") %>' CssClass="linkbutton" Text='<%# Eval("header") %>' runat="server" />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="SHOW" ItemStyle-VerticalAlign="Middle" ItemStyle-HorizontalAlign="Center">
                                        <ItemTemplate>
                                            <asp:CheckBox runat="server" AutoPostBack="true" OnCheckedChanged="cb_show_CAOHOC_CheckedChanged2" Checked='<%# Eval("show") %>' ID="cb_show"></asp:CheckBox>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Ưu tiên">
                                        <ItemTemplate>
                                            <asp:TextBox runat="server" CssClass="form-control form-control-sm" ID="txt_uutien" min="1" max="5" OnTextChanged="txt_uutien_CAOHOC_TextChanged2" AutoPostBack="true" TextMode="Number"
                                                Text='<%# Eval("uutien") %>' />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Ngày viết">
                                        <ItemTemplate>
                                            <asp:Label Text='<%# Eval("ngaytao") %>' runat="server" />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="HOT">
                                        <ItemTemplate>
                                            <asp:CheckBox Checked='<%# Eval("show_new")!=null?Eval("show_new"):false %>' ID="cb_show_new" OnCheckedChanged="cb_show_CAOHOC_CheckedChanged2" runat="server" />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                </Columns>
                            </asp:GridView>
                        </div>
                    </ContentTemplate>
                    <Triggers>
                        <asp:PostBackTrigger ControlID="btn_luu_caohoc" />
                    </Triggers>
                </asp:UpdatePanel>

                <%--CK2--%>
                <asp:UpdatePanel runat="server">
                    <ContentTemplate>
                        <div class="" runat="server" visible="false" id="div_ck2">
                            <div class="card">
                                <div class="card-header card-header-tvu text-yellow-tvu text-center">
                                    <b>Quản lý Chuyên khoa I-II</b>
                                </div>
                            </div>
                           
                            <div class="row">
                                <div class="col">
                                    <asp:TextBox runat="server" required="true" ID="TXT_HEADER_CK2" CssClass="form-control" placeholder="Tiêu đề" />
                                </div>
                                <div class="col">
                                    <asp:TextBox runat="server" CssClass="form-control " placeholder="URL" ID="TXT_LINK_CK2" />
                                </div>
                            </div>
                            <div class="row mt-2">
                                <div class="col">
                                    <div class="input-group">
                                        <div class="input-group-prepend">
                                            <span class="input-group-text">Icon</span>
                                        </div>
                                        <asp:FileUpload ID="file_icon_CK" CssClass="form-control h-auto" AllowMultiple="true" accept=".jpg, .jpeg, .png, .gif" runat="server" />
                                    </div>
                                </div>
                                <div class="col-lg">
                                    <div class="input-group">
                                        <div class="input-group-prepend">
                                            <span class="input-group-text">File</span>
                                        </div>
                                        <asp:FileUpload ID="FILE_CK2" CssClass="form-control h-auto" AllowMultiple="true" accept=".pdf" runat="server" />
                                    </div>
                                    <asp:LinkButton ID="LinkButton8" OnClick="btn_open_modal_file_Click"
                                        CommandArgument="ckII" Text="Chọn File Sever"
                                        CssClass="btn btn-primary" runat="server" />
                                </div>
                            </div>
                            <div class="row mt-2">
                                <div class="col-lg">
                                    <asp:ListView ID="lv_ck2_choosed" OnItemDataBound="lv_choosed_ItemDataBound" ItemPlaceholderID="pl_data" runat="server">
                                        <LayoutTemplate>
                                            <table class="table table-sm">
                                                <asp:PlaceHolder runat="server" ID="pl_data" />
                                            </table>
                                        </LayoutTemplate>
                                        <ItemTemplate>
                                            <tr class="row">
                                                <td class="col-lg">
                                                    <div class="text-break" style="display: flex">
                                                        <asp:LinkButton ID="btn_remove_choosed"
                                                            OnClick="btn_remove_choosed_Click" Text=""
                                                            CommandArgument='<%# Eval("FullPath") %>' CssClass="mr-2 far fa-trash-alt text-danger" runat="server" />
                                                        <asp:LinkButton ID="btn_file_chon" Enabled="false"
                                                            CommandArgument='<%# Eval("FullPath") %>'
                                                            Text='<%# Eval("fileName") %>' runat="server" />
                                                    </div>
                                                </td>
                                            </tr>
                                        </ItemTemplate>
                                    </asp:ListView>
                                </div>
                            </div>
                            <hr />
                            <div class="row">
                                <div class="col">
                                    <asp:HiddenField runat="server" ID="HD_CK2" />
                                    <textarea id="note_CK2" class="summernote"></textarea>
                                    <asp:Button OnClientClick="return read_summernote_CK2();" ID="btn_luu_CK2" OnClick="btn_save_bv_Click" runat="server" Text="Lưu bài" CssClass="btn btn-primary mt-2" />
                                    <asp:LinkButton Text="Hủy sửa bài" CommandArgument="CK2" ID="btn_huysua_ck2" OnClick="huysuabai_Click" CssClass="btn btn-danger mt-2" Visible="false" runat="server" />
                                </div>
                            </div>
                            <asp:GridView ID="GV_CK2" CssClass="table table-sm table-bordered mt-2" PageSize="15" AutoGenerateColumns="false" runat="server"
                                OnPageIndexChanging="GV_CK2_PageIndexChanging"
                                OnRowDeleting="GV_CK2_RowDeleting" OnRowUpdating="GV_CK2_RowUpdating">
                                <Columns>
                                    <asp:TemplateField HeaderText="STT" ItemStyle-HorizontalAlign="Center">
                                        <ItemTemplate>
                                            <%# Container.DataItemIndex + 1 %>
                                            <asp:Label Text='<%# Eval("id") %>' ID="lb_id" Visible="false" runat="server" />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField>
                                        <ItemTemplate>
                                            <asp:LinkButton Font-Underline="false" CommandName="Delete" ToolTip="Remove" CssClass="far fa-trash-alt text-danger" runat="server" />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Tiêu đề">
                                        <ItemTemplate>
                                            <asp:LinkButton Font-Underline="false" OnClick="Label1_Click" CommandArgument='<%# Eval("id") %>' CssClass="linkbutton" Text='<%# Eval("header") %>' runat="server" />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="SHOW" ItemStyle-VerticalAlign="Middle" ItemStyle-HorizontalAlign="Center">
                                        <ItemTemplate>
                                            <asp:CheckBox runat="server" AutoPostBack="true" OnCheckedChanged="cb_show_CK2_CheckedChanged2" Checked='<%# Eval("show") %>' ID="cb_show"></asp:CheckBox>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Ưu tiên">
                                        <ItemTemplate>
                                            <asp:TextBox runat="server" CssClass="form-control form-control-sm" ID="txt_uutien" min="1" max="5" OnTextChanged="txt_uutien_CK2_TextChanged2" AutoPostBack="true" TextMode="Number"
                                                Text='<%# Eval("uutien") %>' />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Ngày viết">
                                        <ItemTemplate>
                                            <asp:Label Text='<%# Eval("ngaytao") %>' runat="server" />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="HOT">
                                        <ItemTemplate>
                                            <asp:CheckBox Checked='<%# Eval("show_new")!=null?Eval("show_new"):false %>' ID="cb_show_new" OnCheckedChanged="cb_show_CK2_CheckedChanged2" runat="server" />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                </Columns>
                            </asp:GridView>
                        </div>
                    </ContentTemplate>
                    <Triggers>
                        <asp:PostBackTrigger ControlID="btn_luu_CK2" />
                    </Triggers>
                </asp:UpdatePanel>

                <%--HỘP THƯ ĐĂNG--%>
                    <asp:UpdatePanel runat="server">
                        <ContentTemplate>
                            <div class="" visible="false" runat="server" id="div_tblichbv">
                                <div class="card">
                                    <div class="card-header card-header-tvu text-yellow-tvu text-center">
                                        <b>Quản lý Đăng Hộp thư</b>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col">
                                        <asp:TextBox runat="server" ID="txt_header_tblichbv" CssClass="form-control" placeholder="Tiêu đề" />
                                    </div>
                                    <div class="col">
                                        <asp:TextBox runat="server" CssClass="form-control " placeholder="URL" ID="txt_url_tbbv" />
                                    </div>
                                </div>
                                <div class="row mt-2">
                                    <div class="col">
                                        <div class="input-group">
                                            <div class="input-group-prepend">
                                                <span class="input-group-text">Icon</span>
                                            </div>
                                            <asp:FileUpload ID="file_icon_BV" CssClass="form-control h-auto" AllowMultiple="true" accept=".jpg, .jpeg, .png, .gif" runat="server" />
                                        </div>
                                    </div>
                                    <div class="col">
                                        <div class="input-group">
                                            <div class="input-group-prepend">
                                                <span class="input-group-text">File</span>
                                            </div>
                                            <asp:FileUpload ID="up_tblichbv" CssClass="form-control h-auto" accept=".jpg, .jpeg, .png, .gif" runat="server" AllowMultiple="true" />
                                        </div>
                                    </div>
                                </div>
                                <div class="row mt-2">
                                    <div class="col-lg">
                                        <asp:ListView ID="lv_baove_choosed" OnItemDataBound="lv_choosed_ItemDataBound" ItemPlaceholderID="pl_data" runat="server">
                                            <LayoutTemplate>
                                                <table class="table table-sm">
                                                    <asp:PlaceHolder runat="server" ID="pl_data" />
                                                </table>
                                            </LayoutTemplate>
                                            <ItemTemplate>
                                                <tr class="row">
                                                    <td class="col-lg">
                                                        <div class="text-break" style="display: flex">
                                                            <asp:LinkButton ID="btn_remove_choosed"
                                                                OnClick="btn_remove_choosed_Click" Text=""
                                                                CommandArgument='<%# Eval("FullPath") %>' CssClass="mr-2 far fa-trash-alt text-danger" runat="server" />
                                                            <asp:LinkButton ID="btn_file_chon" Enabled="false" CommandArgument='<%# Eval("FullPath") %>'
                                                                Text='<%# Eval("fileName") %>' runat="server" />
                                                        </div>
                                                    </td>
                                                </tr>
                                            </ItemTemplate>
                                        </asp:ListView>
                                    </div>
                                </div>
                                <hr />
                                <div class="row">
                                    <div class="col">
                                        <asp:HiddenField runat="server" ID="hd_lichbv" />
                                        <textarea id="note_tbbv" class="summernote"></textarea>
                                        <asp:Button Text="Lưu bài" OnClientClick="return read_summernote_tbbv();" OnClick="btn_save_bv_Click" CssClass="btn btn-primary mt-2" ID="btn_save_tblichbv" runat="server" />
                                        <asp:LinkButton Text="Hủy sửa bài" CommandArgument="TBBV" ID="btn_huysua_tbbv" OnClick="huysuabai_Click" CssClass="btn btn-danger mt-2" Visible="false" runat="server" />
                                    </div>
                                </div>
                                <asp:GridView ID="gv_tblichbv" OnSelectedIndexChanging="gv_tblichbv_SelectedIndexChanging"
                                    OnRowUpdating="gv_tblichbv_RowUpdating" OnRowDeleting="gv_tblichbv_RowDeleting" CssClass="table table-sm table-bordered mt-2" PageSize="15" AutoGenerateColumns="false" runat="server">
                                    <Columns>
                                        <asp:TemplateField HeaderText="STT" ItemStyle-HorizontalAlign="Center">
                                            <ItemTemplate>
                                                <%# Container.DataItemIndex + 1 %>
                                                <asp:Label Text='<%# Eval("id") %>' ID="lb_id" Visible="false" runat="server" />
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField>
                                            <ItemTemplate>
                                                <asp:LinkButton Font-Underline="false" CommandName="Delete" ToolTip="Remove" CssClass="far fa-trash-alt text-danger" runat="server" />
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Tiêu đề">
                                            <ItemTemplate>
                                                <asp:LinkButton Font-Underline="false" OnClick="Label1_Click" CommandArgument='<%# Eval("id") %>' CssClass="linkbutton" Text='<%# Eval("header") %>' runat="server" />
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="SHOW" ItemStyle-VerticalAlign="Middle" ItemStyle-HorizontalAlign="Center">
                                            <ItemTemplate>
                                                <asp:CheckBox runat="server" AutoPostBack="true" OnCheckedChanged="cb_show_tbbv_CheckedChanged" Checked='<%# Eval("show") %>' ID="cb_show_tbbv"></asp:CheckBox>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Ưu tiên">
                                            <ItemTemplate>
                                                <asp:TextBox runat="server" ID="txt_uutien_lichbv" min="1" max="5" AutoPostBack="true" OnTextChanged="txt_uutien_lichbv_TextChanged" TextMode="Number" Text='<%# Eval("uutien") %>' CssClass="form-control" />
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Ngày viết">
                                            <ItemTemplate>
                                                <asp:Label Text='<%# Eval("ngaytao") %>' runat="server" />
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="HOT">
    <ItemTemplate>
        <asp:CheckBox Checked='<%# Eval("show_new")!=null?Eval("show_new"):false %>' ID="cb_show_new" OnCheckedChanged="cb_show_tbbv_CheckedChanged" runat="server" />
    </ItemTemplate>
</asp:TemplateField>
                                    </Columns>
                                </asp:GridView>
                            </div>
                        </ContentTemplate>
                        <Triggers>
                            <asp:PostBackTrigger ControlID="btn_save_tblichbv" />
                        </Triggers>
                    </asp:UpdatePanel>
                    <%--Tuyển sinh TS/CK--%>
                    <asp:UpdatePanel runat="server">
                        <ContentTemplate>
                            <div id="div_lichTS" runat="server">
                                <div class="card">
                                    <div class="card-header card-header-tvu text-yellow-tvu text-center">
                                        <b>Quản lý Lịch đăng ký tư vấn/tuyển sinh</b>
                                    </div>
                                    <div class="card-body">
                                        <div class="row">
                                            <div class="col-lg">
                                                Ngày bắt đầu
                                                <asp:TextBox runat="server" required="true" ID="txt_ngaybd" TextMode="Date" CssClass="form-control" />
                                            </div>
                                            <div class="col-lg">
                                                Ngày kết thúc
                                                <asp:TextBox runat="server" required="true" ID="txt_ngaykt" TextMode="Date" CssClass="form-control" />
                                            </div>
                                            <div class="col-lg">
                                                Chọn loại
                                                <asp:RadioButtonList ID="rd_loaiTS"  required="true" OnSelectedIndexChanged="rd_loaiTS_SelectedIndexChanged" AutoPostBack="true"
                                                    RepeatDirection="Horizontal" RepeatLayout="Table" CssClass="table table-sm table-borderless" runat="server">
                                                    <asp:ListItem Text="Thạc sĩ" />
                                                    <asp:ListItem Text="Chuyên khoa" />
                                                </asp:RadioButtonList>
                                            </div>

                                        </div>
                                        <div class="row">
                                            <div class="col-lg">
                                                Tiêu đề
                                                <asp:TextBox runat="server" placeholder="Tiêu đề nội dung ghi chú" required="true" ID="txt_title_tuvants" CssClass="form-control" />
                                            </div>
                                            <div class="col-lg-2">
                                                <span></span>
                                                <asp:Button Text="Xác nhận" CssClass="btn btn-primary" OnClientClick="return validateAndShowModal('Modal_prossesing');" ID="btn_luu_tuvants" OnClick="btn_luu_tuvants_Click" runat="server" />
                                            </div>
                                        </div>
                                        <div class="row mt-2">
                                            <div class="col-lg">
                                                <asp:GridView runat="server" ID="gv_lichts" AutoGenerateColumns="false" PageSize="10" OnPageIndexChanging="gv_lichts_PageIndexChanging"
                                                    CssClass="table table-sm table-bordered" AllowPaging="True">
                                                    <Columns>
                                                        <asp:TemplateField>
                                                            <ItemTemplate>
                                                                <asp:LinkButton Text="Delete" ForeColor="Red" ID="btn_delete_lichts" OnClick="btn_delete_lichts_Click" CommandArgument='<%# Bind("ID") %>' runat="server" />
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                        <asp:BoundField DataField="title" HeaderText="Tiêu đề" />
                                                        <asp:BoundField DataField="ngaybd" DataFormatString="{0:dd/MM/yyyy}" HeaderText="Ngày bắt đầu" />
                                                        <asp:BoundField DataField="ngaykt" DataFormatString="{0:dd/MM/yyyy}" HeaderText="Ngày kết thúc" />
                                                        <asp:TemplateField >
                                                            <ItemTemplate>
                                                                <asp:LinkButton runat="server" Text="Danh sách ngành" OnClick="btn_dsnganhTS_Click" CommandArgument='<%# Bind("ID") %>' CausesValidation="false" ID="btn_dsnganhTS"></asp:LinkButton>
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                    </Columns>
                                                </asp:GridView>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                </div>
            </div>
                    <div class="row mt-2">
                        <div class="col">
                            <div class="card">
                                <%--Bài viết--%>
                                <asp:UpdatePanel runat="server">
                                    <ContentTemplate>
                                        
                                        <div class="card-header">
                                            <asp:LinkButton Text="Quản lý Bài viết" ID="btn_qlbv" Font-Underline="false" runat="server" OnClick="btn_qlbv_Click" />
                                        </div>
                                        <div class="card-body " runat="server" visible="false" id="qlbv">
                                            <div class="row mb-2">
                                                <div class="col">
                                                    <div class="form-inline">
                                                        <asp:LinkButton Text="Soạn bài" CssClass="btn btn-outline-primary" ID="btn_show_soanbai" OnClick="btn_show_soanbai_Click" runat="server" />
                                                        <asp:LinkButton Text="Danh sách bài" ID="btn_show_quanlybai" CssClass="btn btn-outline-info ml-2" OnClick="btn_show_quanlybai_Click" runat="server" />
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="col">
                                                    <asp:Panel runat="server" DefaultButton="btn_them_danhmuc">
                                                        <div class="card">
                                                            <div class="card-header form-inline">
                                                                <b>Danh mục bài viết</b>
                                                                <asp:LinkButton ID="btn_show_danhmuc" OnClick="btn_show_danhmuc_Click" CssClass="fas fa-eye  ml-auto btn btn-outline-primary btn-sm" runat="server" />
                                                            </div>
                                                            <div class="card-body" id="bd_danhmuc" runat="server" visible="false">
                                                                <div class="row">
                                                                    <div class="col">
                                                                        Danh mục Cha
                                                         <asp:DropDownList runat="server" ID="dr_nav_parent" CssClass="select">
                                                         </asp:DropDownList>
                                                                    </div>
                                                                </div>
                                                                <div class="row mt-2">
                                                                    <div class="col">
                                                                        <asp:TextBox runat="server" CssClass="form-control" ID="txt_header_nav" placeholder="Tiêu đề danh mục" />
                                                                    </div>
                                                                    <div class="col-lg-3">
                                                                        <asp:UpdatePanel runat="server">
                                                                            <ContentTemplate>
                                                                                <asp:Button Text="Thêm" ID="btn_them_danhmuc" CssClass="btn btn-primary" runat="server" OnClick="btn_them_danhmuc_Click" />
                                                                            </ContentTemplate>
                                                                        </asp:UpdatePanel>
                                                                    </div>
                                                                </div>
                                                                <hr />
                                                                <asp:UpdatePanel runat="server">
                                                                    <ContentTemplate>
                                                                        <asp:PlaceHolder runat="server" ID="pl_bv" />
                                                                    </ContentTemplate>
                                                                </asp:UpdatePanel>
                                                            </div>
                                                        </div>
                                                    </asp:Panel>
                                                </div>
                                            </div>
                                            <hr />

                                            <div runat="server" id="quanlybai" visible="false">
                                                <div class="overflow-auto" style="max-height: 70vh">
                                                    <div class="form-inline mb-2">
                                                        <asp:TextBox runat="server" CssClass="form-control w-75"  placeholder="Tiêu đề tìm kiếm" ID="txt_timbaiviet" />
                                                        <asp:LinkButton Text="Tìm" CssClass="btn btn-primary" ID="btn_timbaiviet" OnClick="btn_timbaiviet_Click" runat="server" />
                                                    </div>
                                                    <asp:GridView CssClass="table table-sm table-bordered" AutoGenerateColumns="false" runat="server" ID="gv_baiviet" OnRowDataBound="gv_baiviet_RowDataBound"
                                                        OnRowDeleting="gv_baiviet_RowDeleting" OnRowUpdating="gv_baiviet_RowUpdating">
                                                        <Columns>
                                                            <asp:TemplateField HeaderText="STT" ItemStyle-Width="60" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center">
                                                                <ItemTemplate>
                                                                    <%# Container.DataItemIndex + 1 %>
                                                                </ItemTemplate>
                                                                <ItemStyle HorizontalAlign="Center" />
                                                            </asp:TemplateField>
                                                            <asp:TemplateField ItemStyle-Width="60" ItemStyle-HorizontalAlign="Center">
                                                                <ItemTemplate>
                                                                    <asp:LinkButton Font-Underline="false" CommandName="Delete" ToolTip="Remove" CssClass="far fa-trash-alt text-danger" runat="server" />
                                                                    <asp:Label Text='<%# Eval("id") %>' ID="lb_id" runat="server" Visible="false"></asp:Label>
                                                                </ItemTemplate>
                                                            </asp:TemplateField>
                                                            <asp:TemplateField HeaderText="Show" ItemStyle-Width="60" ItemStyle-HorizontalAlign="Center">
                                                                <ItemTemplate>
                                                                    <asp:CheckBox runat="server" Checked='<%# Bind("show") %>' ID="cb_show" AutoPostBack="true" OnCheckedChanged="cb_show_CheckedChanged1"></asp:CheckBox>
                                                                </ItemTemplate>
                                                            </asp:TemplateField>
                                                            <asp:TemplateField HeaderText="B&#224;i viết">
                                                                <ItemTemplate>
                                                                    <asp:LinkButton runat="server" ForeColor="Black" CommandArgument='<%# Eval("id") %>' Text='<%# Eval("header") %>' 
                                                                        OnClick="Label1_Click" ID="Label1"></asp:LinkButton>
                                                                </ItemTemplate>
                                                            </asp:TemplateField>

                                                            <asp:TemplateField HeaderText="Danh mục" ItemStyle-Width="300px">
                                                                <ItemTemplate>
                                                                    <asp:DropDownList runat="server" AutoPostBack="true" 
                                                                        OnSelectedIndexChanged="dr_danhmuccha_SelectedIndexChanged" ID="dr_danhmuccha" CssClass="select"></asp:DropDownList>
                                                                </ItemTemplate>
                                                            </asp:TemplateField>
                                                            <asp:BoundField HeaderText="Ngày tạo" ItemStyle-Width="100" DataField="ngaytao" />
                                                        </Columns>
                                                        <HeaderStyle CssClass="text-center" />
                                                    </asp:GridView>
                                                </div>
                                            </div>
                                            <div runat="server" id="soanbai">
                                                <div class="modal fade" id="modal_suabaiviet" tabindex="-1" role="dialog" aria-hidden="true">
                                                    <div class="modal-dialog modal-xl">
                                                        <div class="modal-content">
                                                            <div class="modal-body">
                                                                <div class="form-inline mb-2">
                                                                    <h2>
                                                                        <asp:Label Text="Bài viết" ID="lb_sua"  runat="server" /></h2>
                                                                    <button type="button" class="close ml-auto" data-dismiss="modal">&times;</button>
                                                                </div>

                                                                <div class="row">
                                                                    <div class="col">
                                                                            <asp:TextBox runat="server" ID="txt_header_bv" CssClass="form-control " placeholder="Tiêu đề" />
                                                                        <asp:HiddenField runat="server" ID="hd_id_bv" />
                                                                    </div>
                                                                </div>
                                                                <div class="row mt-2">
                                                                    <div class="col">
                                                                            
                                                                            <asp:TextBox runat="server" CssClass="form-control " placeholder="URL (nếu có không viết nội dung bên dưới)" ID="txt_url_bv" />
                                                                    </div>
                                                                </div>

                                                                <div class="row mt-2">
                                                                    <div class="col">
                                                                        <div class="custom-file custom-file-sm">
                                                                            <asp:FileUpload class="custom-file-input" AllowMultiple="true" runat="server" ID="file_bv" accept=".pdf" />
                                                                            <label class="custom-file-label">Up File PDF đính kèm nếu có (hiển thị cuối cùng sau nội dung bên dưới)</label>
                                                                        </div>
                                                                        <div id="file_list" runat="server"></div>
                                                                    </div>
                                                                </div>
                                                                <div class="row mt-2">
                                                                    <div class="col-lg">
                                                                        <div class="custom-file custom-file-sm">
                                                                            <asp:FileUpload class="custom-file-input" runat="server" ID="file_download" />
                                                                            <label class="custom-file-label">File Biểu mẫu tải về</label>
                                                                        </div>
                                                                        <div id="file_down" runat="server"></div>
                                                                    </div>
                                                                    <div class="col-lg">
                                                                        <asp:LinkButton ID="btn_open_modal_file" OnClick="btn_open_modal_file_Click"
                                                                            CommandArgument="baiviet" Text="Chọn File Sever"
                                                                            CssClass="btn btn-primary" runat="server" />
                                                                    </div>
                                                                </div>
                                                                <div class="row mt-2">
                                                                    <div class="col-lg">
                                                                        <asp:ListView ID="lv_choosed" OnItemDataBound="lv_choosed_ItemDataBound" ItemPlaceholderID="pl_data" runat="server">
                                                                            <LayoutTemplate>
                                                                                <table class="table table-sm">
                                                                                    <asp:PlaceHolder runat="server" ID="pl_data" />
                                                                                </table>
                                                                            </LayoutTemplate>
                                                                            <ItemTemplate>
                                                                                <tr class="row">
                                                                                    <td class="col-lg">
                                                                                        <div class="text-break" style="display: flex">
                                                                                            <asp:LinkButton ID="btn_remove_choosed"
                                                                                                OnClick="btn_remove_choosed_Click" Text=""
                                                                                                CommandArgument='<%# Eval("FullPath") %>' CssClass="mr-2 far fa-trash-alt text-danger" runat="server" />
                                                                                            <asp:LinkButton ID="btn_file_chon" Enabled="false" CommandArgument='<%# Eval("FullPath") %>'
                                                                                                Text='<%# Eval("fileName") %>' runat="server" />
                                                                                        </div>
                                                                                    </td>
                                                                                </tr>
                                                                            </ItemTemplate>
                                                                        </asp:ListView>
                                                                    </div>
                                                                </div>
                                                                <hr />
                                                                <div class="row">
                                                                    <div class="col-lg">
                                                                        <asp:HiddenField runat="server" ID="hd_bv" />
                                                                        <textarea id="note_bv" class="summernote"></textarea>
                                                                    </div>
                                                                </div>

                                                                <div class="row mt-2">
                                                                    <div class="col-lg">
                                                                        <div class="form-inline">
                                                                        <asp:LinkButton Text="Hủy sửa bài" ID="huysuabai" OnClientClick="$('#modal_suabaiviet').modal('hide');" OnClick="huysuabai_Click" CssClass="btn btn-danger mt-2" Visible="false" runat="server" />
                                                                        <asp:Button Text="Lưu bài" OnClientClick="return read_summernote_bv();" CssClass="btn btn-primary mt-2 ml-auto" ID="btn_save_bv" runat="server" OnClick="btn_save_bv_Click" />

                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                
                                            </div>
                                        </div>
                                    </ContentTemplate>
                                    <Triggers>
                                        <asp:PostBackTrigger ControlID="btn_save_bv" />
                                    </Triggers>
                                </asp:UpdatePanel>
                            </div>
                        </div>
                    </div>
            <asp:UpdatePanel runat="server">
                <ContentTemplate>
                    <div class="row mt-2">
                        <div class="col">
                            <div class="card">
                                <div class="card-header">
                                    <div class="form-inline">
                                        <asp:LinkButton Text="Quản lý ngành học" ID="btn_qlnganh" Font-Underline="false" runat="server" OnClick="btn_qlnganh_Click" />
                                        <div class="ml-auto ">
                                        </div>
                                    </div>
                                </div>
                                <div class="card-body" id="ql_nganh" visible="false" runat="server">
                                    <div class="form-inline">
                                        <asp:Button Text="Danh sách ngành" ID="btn_dsnganh" OnClick="btn_dsnganh_Click" CssClass="btn btn-primary" runat="server" />
                                        <asp:Button Text="Ngành BSKT" OnClick="btn_bsktnganh_Click" ID="btn_bsktnganh" CssClass="btn btn-info  ml-2" runat="server" />
                                        <asp:Button Text="DANH SÁCH BSKT" OnClick="btn_DSBSKT_Click" ID="btn_DSBSKT" CssClass="btn btn-success ml-2" runat="server" />
                                    </div>
                                    <div id="ds_nganh" visible="false" runat="server">
                                        <div class="row mb-2 mt-2">
                                            <div class="col-lg">
                                                <asp:TextBox runat="server" CssClass="form-control" ID="txt_manganh" placeholder="Mã ngành" />
                                            </div>
                                        </div>
                                        <div class="row mb-2">
                                            <div class="col-lg">
                                                <asp:TextBox runat="server" CssClass="form-control" ID="txt_tennganh" placeholder="Tên ngành" />
                                            </div>
                                        </div>
                                        <div class="row mb-2">
                                            <div class="col-lg">
                                                <asp:DropDownList runat="server" ID="dr_nhomnganh" CssClass="select" DataTextField="group_name" DataValueField="id" DataSourceID="Ngang_group">
                                                </asp:DropDownList>
                                                
                                            </div>
                                            <div class="col-lg">
                                                <asp:LinkButton Text="Thêm Nhóm" CssClass="btn btn-outline-info btn-sm" ID="btn_add_group_nganh" OnClick="btn_add_group_nganh_Click" runat="server" />
                                            </div>
                                        </div>
                                        <div class="row mb-2">
                                            <div class="col-lg">
                                                <asp:Button Text="Lưu ngành" ID="btn_savenganh" OnClick="btn_savenganh_Click" CssClass="btn btn-primary" runat="server" />
                                            </div>
                                        </div>
                                        <hr />
                                        <div  style="overflow: auto; max-height: 45rem">
                                            <asp:GridView runat="server" ID="gv_nganh" OnRowCancelingEdit="gv_nganh_RowCancelingEdit" PageSize="10" OnPageIndexChanging="gv_nganh_PageIndexChanging"
                                                 OnRowDataBound="gv_nganh_RowDataBound" OnRowEditing="gv_nganh_RowEditing" OnRowDeleting="gv_nganh_RowDeleting"
                                                OnRowUpdating="gv_nganh_RowUpdating" CssClass="table table-sm table-bordered mb-4" AutoGenerateColumns="False" AllowPaging="True">
                                                <Columns>
                                                    <asp:TemplateField>
                                                        <ItemTemplate   >
                                                            <asp:LinkButton Text="Edit" CommandName="Edit" CssClass="text-success" Font-Underline="false" runat="server" />
                                                            <asp:LinkButton Text="Delete" ID="btn_delete_nganh" CommandArgument='<%# Eval("id") %>' CommandName="Delete" CssClass="text-danger" Font-Underline="false" runat="server" />
                                                        </ItemTemplate>
                                                        <EditItemTemplate>
                                                            <asp:LinkButton Text="Update" ID="btn_update_nganh" CommandArgument='<%# Eval("id") %>'  CommandName="Update" CssClass="text-success" Font-Underline="false" runat="server" />
                                                            <asp:LinkButton Text="Cancel" CommandName="Cancel" CssClass="text-danger" Font-Underline="false" runat="server" />
                                                        </EditItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="M&#227; ng&#224;nh">
                                                        <EditItemTemplate>
                                                            <asp:TextBox runat="server" CssClass="form-control form-control-sm" Text='<%# Eval("manganh") %>' ID="txt_edit_manganh"></asp:TextBox>
                                                        </EditItemTemplate>
                                                        <ItemTemplate>
                                                            <asp:Label runat="server" Text='<%# Bind("manganh") %>' ID="Label1"></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="T&#234;n ng&#224;nh">
                                                        <EditItemTemplate>
                                                            <asp:TextBox runat="server" CssClass="form-control form-control-sm" Text='<%# Eval("ten_nganh") %>' ID="txt_edit_tennganh"></asp:TextBox>
                                                        </EditItemTemplate>
                                                        <ItemTemplate>
                                                            <asp:Label runat="server" Text='<%# Bind("ten_nganh") %>' ID="Label2"></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Nh&#243;m ng&#224;nh">
                                                        <EditItemTemplate>
                                                            <asp:DropDownList CssClass="select" AutoPostBack="true" 
                                                                OnSelectedIndexChanged="dr_edit_nhomnganh_SelectedIndexChanged" runat="server" ID="dr_edit_nhomnganh" DataSourceID="Ngang_group" DataTextField="group_name" DataValueField="id">
                                                            </asp:DropDownList>
                                                        </EditItemTemplate>
                                                        <ItemTemplate>
                                                            <asp:Label runat="server" ID="lb_nhomnganh"></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                </Columns>
                                            </asp:GridView>
                                        </div>
                                    </div>
                                    <div id="ds_bskt" runat="server" visible="false">
                                        <div class="row">
                                            <hr />
                                            <div class="col-lg">
                                                <b>Ngành học</b>
                                                <asp:DropDownList ID="cb_nganh_hoc" CssClass="select" OnSelectedIndexChanged="dr_nganh_bskt_SelectedIndexChanged" AutoPostBack="true" runat="server" DataSourceID="nganhdb" DataTextField="ten_nganh" DataValueField="id">
                                                </asp:DropDownList>
                                                <hr />
                                                Ngành phải bổ sung kiến thức
                                                <asp:DropDownList runat="server" CssClass="select" ID="dr_nganh_bskt" OnSelectedIndexChanged="dr_nganh_bskt_SelectedIndexChanged" AutoPostBack="true" DataSourceID="nganhdb" DataTextField="ten_nganh"
                                                    DataValueField="id">
                                                </asp:DropDownList>
                                                <%--<asp:HiddenField runat="server" ID="hd_bskt" />--%>
                                                <%--<textarea id="note_bskt" class="summernote"></textarea>--%>

                                                <asp:Button Text="Lưu" OnClientClick="return read_summernote_bskt();" CssClass="btn btn-primary mt-2" ID="btn_bskt" runat="server" OnClick="btn_bskt_Click" />
                                            </div>
                                            <div class="col-lg">
                                                <asp:Repeater ID="rp_monhoc" runat="server">
                                                    <HeaderTemplate>
                                                        <h2>Môn học bổ sung kiến thức</h2>
                                                        <table class="table table-sm">
                                                    </HeaderTemplate>
                                                    <ItemTemplate>
                                                        <tr>
                                                            <td>
                                                                <%# Container.ItemIndex + 1 %>
                                                            </td>
                                                            <td>
                                                                <asp:DropDownList runat="server" ID="dr_monhoc" CssClass="select" DataSourceID="Monhoc" DataTextField="tenmon" DataValueField="id">
                                                                </asp:DropDownList>
                                                            </td>
                                                            <td>
                                                                <asp:LinkButton ID="btnDelete" OnClick="btnDelete_Click" CssClass="fas fa-trash-alt text-danger" CommandArgument='<%# Container.ItemIndex %>' runat="server" />
                                                            </td>
                                                        </tr>
                                                    </ItemTemplate>
                                                    <FooterTemplate>
                                                        <tr>
                                                            <td>
                                                                <asp:LinkButton Text="Thêm hàng" ID="them_hang" OnClick="them_hang_Click" runat="server" />
                                                            </td>
                                                            <td></td>
                                                            <td>
                                                                <asp:LinkButton Text="Xóa toàn bộ" ID="btn_xoaallhang" ForeColor="Red" OnClick="btn_xoaallhang_Click" runat="server" />
                                                            </td>
                                                        </tr>
                                                        </table>
                                                    </FooterTemplate>
                                                </asp:Repeater>
                                            </div>
                                        </div>
                                    </div>
                                    <asp:SqlDataSource runat="server" ID="nganhdb" ConnectionString='<%$ ConnectionStrings:SDHConnectionString %>' OldValuesParameterFormatString="original_{0}"
                                        SelectCommand="SELECT * FROM [Nganh]">
                                    </asp:SqlDataSource>
                                </div>
                            </div>
                        </div>
                    </div>
                </ContentTemplate>
            </asp:UpdatePanel>
            <asp:UpdatePanel runat="server">
                <ContentTemplate>
                    <div class="row mt-2">
                        <div class="col">
                            <div class="card">
                                <div class="card-header">
                                    <asp:LinkButton Text="Quản lý môn học" ID="btn_qlmonhoc" Font-Underline="false" runat="server" OnClick="btn_qlmonhoc_Click" />
                                </div>
                                <div class="card-body " id="qlmonhoc" runat="server" visible="false">
                                    <div class="row">
                                        <div class="col-lg">
                                            <asp:TextBox ID="txt_monhoc" placeholder="Tên môn" runat="server" CssClass="form-control form-control-sm"></asp:TextBox>
                                        </div>
                                        <div class="col-lg">
                                            <asp:TextBox ID="txt_hocphi" placeholder="Học phí" TextMode="Number" runat="server" CssClass="form-control form-control-sm"></asp:TextBox>
                                        </div>
                                        <div class="col-lg">
                                            <asp:LinkButton Text="Lưu" ID="save_monhoc" OnClick="save_monhoc_Click" CssClass="btn btn-primary btn-sm" runat="server" />
                                        </div>
                                    </div>
                                    <hr />
                                    <asp:GridView runat="server" ID="gv_monhoc" CssClass="mt-2 table table-sm table-bordered" AutoGenerateColumns="False" DataKeyNames="id" DataSourceID="Monhoc" AllowSorting="True">
                                        <Columns>
                                            <asp:CommandField ShowEditButton="True" ItemStyle-Width="10%" ShowDeleteButton="True"></asp:CommandField>
                                            <asp:TemplateField HeaderText="id" SortExpression="id" Visible="false">
                                                <ItemTemplate>
                                                    <asp:Label runat="server" Text='<%# Bind("id") %>' ID="Label3"></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Tên môn học" SortExpression="tenmon">
                                                <EditItemTemplate>
                                                    <asp:TextBox runat="server" CssClass="form-control form-control-sm" Text='<%# Bind("tenmon") %>' ID="TextBox1"></asp:TextBox>
                                                </EditItemTemplate>
                                                <ItemTemplate>
                                                    <asp:Label runat="server" Text='<%# Bind("tenmon") %>' ID="Label1"></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Học phí" SortExpression="hocphi">
                                                <EditItemTemplate>
                                                    <asp:TextBox runat="server" CssClass="form-control form-control-sm" Text='<%# Bind("hocphi") %>' ID="TextBox2"></asp:TextBox>
                                                </EditItemTemplate>
                                                <ItemTemplate>
                                                    <asp:Label runat="server" Text='<%# Bind("hocphi") %>' ID="Label2"></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>

                                        </Columns>
                                        <HeaderStyle CssClass="text-center" />

                                    </asp:GridView>
                                    
                                </div>
                            </div>
                        </div>
                    </div>
                    <asp:SqlDataSource runat="server" ID="Monhoc" ConflictDetection="CompareAllValues" ConnectionString='<%$ ConnectionStrings:SDHConnectionString %>' DeleteCommand="DELETE FROM [Monhoc] WHERE [id] = @original_id AND [tenmon] = @original_tenmon AND [hocphi] = @original_hocphi"
                        InsertCommand="INSERT INTO [Monhoc] ([id], [tenmon], [hocphi]) VALUES (@id, @tenmon, @hocphi)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [Monhoc] ORDER BY [tenmon]"
                        UpdateCommand="UPDATE [Monhoc] SET [tenmon] = @tenmon, [hocphi] = @hocphi WHERE [id] = @original_id AND [tenmon] = @original_tenmon AND [hocphi] = @original_hocphi">
                        <DeleteParameters>
                            <asp:Parameter Name="original_id" Type="Int32"></asp:Parameter>
                            <asp:Parameter Name="original_tenmon" Type="String"></asp:Parameter>
                            <asp:Parameter Name="original_hocphi" Type="Int32"></asp:Parameter>
                        </DeleteParameters>
                        <InsertParameters>
                            <asp:Parameter Name="id" Type="Int32"></asp:Parameter>
                            <asp:Parameter Name="tenmon" Type="String"></asp:Parameter>
                            <asp:Parameter Name="hocphi" Type="Int32"></asp:Parameter>
                        </InsertParameters>
                        <UpdateParameters>
                            <asp:Parameter Name="tenmon" Type="String"></asp:Parameter>
                            <asp:Parameter Name="hocphi" Type="Int32"></asp:Parameter>
                            <asp:Parameter Name="original_id" Type="Int32"></asp:Parameter>
                            <asp:Parameter Name="original_tenmon" Type="String"></asp:Parameter>
                            <asp:Parameter Name="original_hocphi" Type="Int32"></asp:Parameter>
                        </UpdateParameters>
                    </asp:SqlDataSource>
                </ContentTemplate>
            </asp:UpdatePanel>
                    
            <asp:UpdatePanel runat="server">
                <ContentTemplate>
                    <div class="row mt-2">
                        <div class="col">
                            <div class="card">
                                <div class="card-header">
                                    <asp:LinkButton Text="Hộp thư nhận" ID="btn_qlhopthu" Font-Underline="false" runat="server" OnClick="btn_qlhopthu_Click" />
                                </div>
                                <div class="card-body " id="ql_hopthu" runat="server" visible="false">
                                    <asp:GridView ID="gv_hopthu" runat="server" CssClass="table table-sm table-bordered" AutoGenerateColumns="False" DataKeyNames="ID" DataSourceID="db_hopthu">
                                        <Columns>
                                            <asp:CommandField HeaderStyle-Width="8%" ShowDeleteButton="True"></asp:CommandField>
                                            <asp:BoundField Visible="false" DataField="ID" HeaderText="ID" ReadOnly="True" SortExpression="ID"></asp:BoundField>
                                            <asp:BoundField DataField="user_gop" HeaderText="Người dùng" SortExpression="user_gop"></asp:BoundField>
                                            <asp:BoundField DataField="ngayviet" HeaderText="Ngày Viết" SortExpression="ngayviet"></asp:BoundField>
                                            <asp:BoundField DataField="noidung" HeaderText="Nội dung" SortExpression="noidung"></asp:BoundField>
                                        </Columns>
                                    </asp:GridView>
                                    <asp:SqlDataSource runat="server" ID="db_hopthu" ConflictDetection="CompareAllValues" ConnectionString='<%$ ConnectionStrings:SDHConnectionString %>' DeleteCommand="DELETE FROM [HOPTHU] WHERE [ID] = @original_ID " InsertCommand="INSERT INTO [HOPTHU] ([ID], [noidung], [ngayviet], [user_gop]) VALUES (@ID, @noidung, @ngayviet, @user_gop)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [HOPTHU] ORDER BY [ngayviet] DESC" UpdateCommand="UPDATE [HOPTHU] SET [noidung] = @noidung, [ngayviet] = @ngayviet, [user_gop] = @user_gop WHERE [ID] = @original_ID AND (([noidung] = @original_noidung) OR ([noidung] IS NULL AND @original_noidung IS NULL)) AND (([ngayviet] = @original_ngayviet) OR ([ngayviet] IS NULL AND @original_ngayviet IS NULL)) AND (([user_gop] = @original_user_gop) OR ([user_gop] IS NULL AND @original_user_gop IS NULL))">
                                        <DeleteParameters>
                                            <asp:Parameter Name="original_ID" Type="Int32"></asp:Parameter>
                                            <asp:Parameter Name="original_noidung" Type="String"></asp:Parameter>
                                            <asp:Parameter Name="original_ngayviet" Type="DateTime"></asp:Parameter>
                                            <asp:Parameter Name="original_user_gop" Type="String"></asp:Parameter>
                                        </DeleteParameters>
                                        <InsertParameters>
                                            <asp:Parameter Name="ID" Type="Int32"></asp:Parameter>
                                            <asp:Parameter Name="noidung" Type="String"></asp:Parameter>
                                            <asp:Parameter Name="ngayviet" Type="DateTime"></asp:Parameter>
                                            <asp:Parameter Name="user_gop" Type="String"></asp:Parameter>
                                        </InsertParameters>
                                        <UpdateParameters>
                                            <asp:Parameter Name="noidung" Type="String"></asp:Parameter>
                                            <asp:Parameter Name="ngayviet" Type="DateTime"></asp:Parameter>
                                            <asp:Parameter Name="user_gop" Type="String"></asp:Parameter>
                                            <asp:Parameter Name="original_ID" Type="Int32"></asp:Parameter>
                                            <asp:Parameter Name="original_noidung" Type="String"></asp:Parameter>
                                            <asp:Parameter Name="original_ngayviet" Type="DateTime"></asp:Parameter>
                                            <asp:Parameter Name="original_user_gop" Type="String"></asp:Parameter>
                                        </UpdateParameters>
                                    </asp:SqlDataSource>
                                </div>
                            </div>
                        </div>
                    </div>
                </ContentTemplate>
            </asp:UpdatePanel>
            <asp:UpdatePanel runat="server" ScrollToTopOnPostBack="false">
                <ContentTemplate>
                    <div class="row mt-2" >
                        <div class="col">
                            <div class="card">
                                <div class="card-header">
                                    <asp:LinkButton Text="Quản lý File" OnClientClick="open_file_load();" ID="btn_qlfile" Font-Underline="false" runat="server" OnClick="btn_qlfile_Click" />
                                </div>
                                <div class="card-body " id="ql_file" runat="server" visible="false">
                                    <div class="row">
                                        <div class="col-lg">
                                            <asp:FileUpload runat="server" ID="up_newfile" AllowMultiple="true" />
                                        </div>
                                        <div class="col-lg">
                                            <asp:Button Text="Upload" CssClass="btn btn-primary" ID="btn_upload_file" OnClick="btn_upload_file_Click" runat="server" />
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-lg">
                                            <div class="row">
                                                <div class="col-lg">
                                                    <asp:LinkButton CssClass="btn btn-outline-primary far fa-arrow-alt-circle-left" OnClick="btn_back_Click" Font-Underline="false" ID="btn_back" runat="server" />
                                                </div>
                                                <div class="col-lg justify-content-end d-flex">
                                                    <asp:LinkButton  CssClass="fas fa-folder btn btn-outline-primary " data-toggle="modal" data-target="#Modal_create_Folder" ID="btn_newFolder"  runat="server" />
                                                </div>
                                            </div>
                                            <asp:ListView ID="lv_file" OnDataBound="lv_file_DataBound" runat="server" OnItemDataBound="lv_file_ItemDataBound" ItemPlaceholderID="pl_itemTemplate">
                                                <LayoutTemplate>
                                                    <table class="table table-sm table-hover table-borderless">
                                                        <tr >
                                                            <td>
                                                                <asp:Label Text="" ID="lb_thumuc" runat="server" />
                                                            </td>
                                                        </tr>
                                                            <asp:PlaceHolder runat="server" ID="pl_itemTemplate" />
                                                    </table>
                                                </LayoutTemplate>
                                                <ItemTemplate>
                                                    <tr>
                                                        <td>
                                                            <div class="text-break" style="display: flex">
                                                                <asp:LinkButton Text="" ID="btn_remove" OnClientClick="return remove_file();" OnClick="btn_remove_Click" CssClass="far fa-trash-alt mr-2 text-danger" runat="server" />
                                                                <asp:LinkButton Text="" ID="btn_file" OnClick="btn_file_OpenFile_Click" Visible="false" CssClass="" runat="server" />
                                                                <asp:LinkButton Text="" ID="btn_file_Folder" OnClick="btn_file_OpenFolder_Click" Visible="false" CssClass="" runat="server" />
                                                            </div>
                                                        </td>
                                                    </tr>
                                                </ItemTemplate>
                                                <EmptyItemTemplate>
                                                    <div class="col-lg-6 mt-2">
                                                    </div>
                                                </EmptyItemTemplate>
                                            </asp:ListView>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </ContentTemplate>
                <Triggers>
                    <asp:PostBackTrigger ControlID="btn_upload_file" />
                </Triggers>
            </asp:UpdatePanel>
            <asp:UpdatePanel runat="server">
                <ContentTemplate>
                    <div class="row mt-2">
                        <div class="col">
                            <div class="card">
                                <div class="card-header">
                                    <asp:LinkButton Text="Bố cục Trang chủ" ID="btn_ql_home" OnClick="btn_ql_home_Click" runat="server" />
                                </div>
                                <div class="card-body " id="div_body_Home" runat="server" visible="false">
                                    <div class="row">
                                        <div class="col-lg-6">
                                            <div class="container justify-content-center">
                                            <asp:GridView CssClass="table table-sm table-bordered" OnRowUpdating="gv_homeTB_RowUpdating" 
                                                ShowHeader="false" runat="server" ID="gv_homeTB"
                                                AutoGenerateColumns="False" OnRowDataBound="gv_homeTB_RowDataBound" DataSourceID="LoaiTB_DB">
                                                <Columns>
                                                    <asp:TemplateField HeaderText="load_tb" SortExpression="load_tb">
                                                        <ItemTemplate>
                                                            <asp:LinkButton runat="server" Text='<%# Bind("name") %>' ID="btn_chon_tb"></asp:LinkButton>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField>
                                                        <ItemTemplate>
                                                            <asp:DropDownList runat="server" ID="DR_POSITION" AutoPostBack="true" OnSelectedIndexChanged="DR_POSITION_SelectedIndexChanged" CssClass="form-control form-control-sm">
                                                                <asp:ListItem Text="" />
                                                                <asp:ListItem Text="LEFT" />
                                                                <asp:ListItem Text="MID" />
                                                            </asp:DropDownList>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField>
                                                        <ItemTemplate>
                                                            <asp:TextBox ID="txt_index"  onblur="post_(this);" Text="0" OnTextChanged="txt_index_TextChanged" TextMode="Number" min="0" runat="server" CssClass="form-control form-control-sm" />
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                </Columns>
                                                <RowStyle VerticalAlign="Middle" />
                                            </asp:GridView>
                                            </div>
                                        </div>
                                        <div class="col-lg-6">
                                            <asp:GridView runat="server" ID="CSDG_NN">

                                            </asp:GridView>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-lg">
                                            <asp:HiddenField runat="server" ID="hd_footernote" />
                                            <textarea id="footer_note" class="summernote"></textarea>
                                            <asp:LinkButton Text="Lưu Chân Trang" OnClientClick="read_summer_footer();" ID="btn_luu_footer" OnClick="btn_luu_footer_Click" CssClass="btn btn-primary" runat="server" />
                                        </div>
                                    </div>
                                    <asp:SqlDataSource runat="server" ID="LoaiTB_DB" ConnectionString='<%$ ConnectionStrings:SDHConnectionString %>' SelectCommand="SELECT * FROM [control_dynamic] ORDER BY [position], [index_control], [name]"></asp:SqlDataSource>
                                </div>
                            </div>
                        </div>
                    </div>
                </ContentTemplate>
            </asp:UpdatePanel>
            <asp:UpdatePanel runat="server">
                <ContentTemplate>
                    <div class="row mt-2">
                        <div class="col">
                            <div class="card">
                                <div class="card-header">
                                    <asp:LinkButton Text="Quản lý Form" OnClick="btn_qlform_Click" ID="btn_qlform" runat="server" />
                                </div>
                                <div class="card-body " id="QL_form" runat="server" visible="false">
                                    <div class="d-flex">
                                        <div class="btn-group">

                                            <asp:LinkButton Text="Form mới" OnClick="btn_newForm_Click" ID="btn_newForm" CssClass="btn btn-sm btn-primary" runat="server" />
                                            <asp:LinkButton Text="Danh sách Form" OnClick="btn_DSForm_Click" ID="btn_DSForm" CssClass="btn btn-sm btn-info" runat="server" />
                                            <asp:LinkButton Text="Nhóm dịch vụ" OnClick="btn_group_DVDT_Click" ID="btn_group_DVDT" CssClass="btn btn-sm btn-primary" runat="server" />
                                        </div>
                                    </div>
                                    <div runat="server" id="Create_form" visible="false">

                                        <div class="row">
                                            <div class="col-lg-6">
                                                Tên Form
                                                <div class="">
                                                    <asp:TextBox ID="txtFormName" required="true" CssClass="form-control form-control-sm w-100" runat="server" Placeholder="Nhập tên form"></asp:TextBox>
                                                    <asp:LinkButton Text="Tạo form" Visible="false" ID="btn_create_form" OnClick="btn_create_form_Click" CssClass="btn btn-sm btn-info" runat="server" />
                                                </div>
                                            </div>
                                            <div class="col-lg">
                                                Bố cục
                                                <asp:RadioButtonList RepeatLayout="Table" RepeatDirection="Horizontal" ID="rd_count_colum" runat="server">
                                                    <asp:ListItem Value="1" Text="Một cột" Selected="true" />
                                                    <asp:ListItem Value="2" Text="Hai cột" />
                                                    <asp:ListItem Value="3" Text="Ba cột" />
                                                </asp:RadioButtonList>
                                            </div>
                                            <div class="col-lg">
                                                <asp:CheckBox Text="Cho phép tải Form giống mẫu Word" ID="cb_quyentai" runat="server" />
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-lg">
                                                <div class="d-flex justify-content-center">
                                                    Mô tả Form
                                                </div>
                                                <asp:HiddenField runat="server" ID="hd_note_mota_form" />
                                                <textarea id="note_mota_form" class="summernote"></textarea>
                                            </div>
                                        </div>
                                        <div class="row mt-2">
                                            <div class="col-lg">
                                                <div class="d-flex justify-content-center">
                                                    Trường dữ liệu
                                                </div>
                                                <asp:GridView runat="server" ShowFooter="true" RowStyle-VerticalAlign="Middle"
                                                    OnRowUpdating="gv_control_form_RowUpdating"  OnRowDeleting="gv_control_form_RowDeleting"
                                                    OnRowDataBound="gv_control_form_RowDataBound" AutoGenerateColumns="false" 
                                                    ID="gv_control_form" CssClass="table table-sm table-bordered">
                                                    <Columns>
                                                        <asp:TemplateField HeaderText="" ItemStyle-Width="5%">
                                                            <ItemTemplate>
                                                                <asp:LinkButton Text="Xóa" OnClick="btn_delete_field_Click" runat="server" ID="btn_delete_field" CssClass="btn btn-sm btn-danger" />
                                                            </ItemTemplate> 
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="STT" ItemStyle-Width="60" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center">
                                                            <ItemTemplate>
                                                                <%# Container.DataItemIndex + 1 %>
                                                            </ItemTemplate>
                                                            <ItemStyle HorizontalAlign="Center" />
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="Tên Trường" ItemStyle-Width="30%">
                                                            <ItemTemplate>
                                                                <asp:TextBox runat="server" required="true" ID="txt_name_field" CssClass="form-control form-control-sm" placeholder="Tên trường" />
                                                            </ItemTemplate>
                                                            <FooterTemplate>
                                                                <asp:LinkButton OnClick="btn_add_field_Click" ID="btn_add_field" Text="Thêm trường" CssClass="btn btn-sm btn-primary" runat="server" />
                                                            </FooterTemplate>
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="Loại nhập liệu" ItemStyle-Width="20%">
                                                            <ItemTemplate>
                                                                <asp:DropDownList ID="dr_loai_control" AutoPostBack="true" OnSelectedIndexChanged="dr_textbox_mode_SelectedIndexChanged" CssClass="form-control form-control-sm" runat="server">
                                                                    <asp:ListItem Text="TextBox" Value="TextBox"></asp:ListItem>
                                                                    <asp:ListItem Text="Dropdown" Value="Dropdown"></asp:ListItem>
                                                                    <asp:ListItem Text="Checkbox" Value="Checkbox"></asp:ListItem>
                                                                    <asp:ListItem Text="Radio" Value="Radio"></asp:ListItem>
                                                                    <asp:ListItem Text="FileUpload" Value="FileUpload"></asp:ListItem>
                                                                </asp:DropDownList>
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="Giá trị">
                                                            <ItemTemplate>
                                                                <asp:DropDownList ID="dr_textbox_mode" Visible="false" CssClass="form-control form-control-sm" runat="server">
                                                                    <asp:ListItem Text="Văn bản" />
                                                                    <asp:ListItem Value="Number" Text="Số" />
                                                                    <asp:ListItem Value="Date" Text="Ngày tháng" />
                                                                </asp:DropDownList>
                                                                <asp:TextBox runat="server" Visible="false" 
                                                                    placeholder="Cách nhau dấu ;" ID="txt_giatri" CssClass="form-control form-control-sm" />

                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="Bắt buộc" ItemStyle-Width="10%" ItemStyle-HorizontalAlign="Center">
                                                            <ItemTemplate>
                                                                <asp:CheckBox Text="" ID="cb_required" runat="server" />
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                    </Columns>
                                                    <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                                </asp:GridView>
                                            </div>
                                        </div>

                                        <asp:Button ID="btnSaveFields" OnClientClick="return read_summernote_mota_form();" 
                                            CssClass="btn btn-sm btn-primary mt-2" runat="server" Text="Lưu Form" OnClick="btnSaveFields_Click" />
                                    </div>
                                    <div runat="server" id="DS_Form" visible="false">
                                        <div class="row mt-2">
                                            <div class="col-lg ">
                                                <div class="overflow-auto">
                                                <asp:GridView ID="gv_ds_form" AutoGenerateColumns="false" EmptyDataRowStyle-CssClass="table-responsive"
                                                    OnRowDataBound="gv_ds_form_RowDataBound" OnRowUpdating="gv_ds_form_RowUpdating" 
                                                    OnRowEditing="gv_ds_form_RowEditing" OnSelectedIndexChanging="gv_ds_form_SelectedIndexChanging"
                                                    CssClass="table table-sm table-bordered w-100 " OnRowDeleting="gv_ds_form_RowDeleting" 
                                                    OnRowCancelingEdit="gv_ds_form_RowCancelingEdit" runat="server">
                                                    <Columns>
                                                        <asp:TemplateField ShowHeader="False" ItemStyle-HorizontalAlign="Center" ItemStyle-VerticalAlign="Middle" ItemStyle-Width="8%">
                                                            <EditItemTemplate>
                                                                <div>
                                                                    <asp:LinkButton runat="server" Width="100%" Text="Update"  CommandName="Update" CausesValidation="True" ID="LinkButtonupdate"></asp:LinkButton>
                                                                    <asp:LinkButton runat="server" Width="100%" Text="Cancel" CommandName="Cancel" CausesValidation="False" ID="LinkButton2"></asp:LinkButton>
                                                                </div>
                                                            </EditItemTemplate>
                                                            <ItemTemplate>
                                                                <div>
                                                                <asp:LinkButton runat="server" Text="Edit" Width="100%" CommandName="Edit" CausesValidation="False" ID="LinkButton2"></asp:LinkButton>
                                                                <asp:LinkButton runat="server" Text="Delete" Width="100%" CommandName="Delete" CausesValidation="False" ID="LinkButton1"></asp:LinkButton>
                                                                </div>
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="Form" ItemStyle-CssClass="align-content-center" ItemStyle-VerticalAlign="Middle">
                                                            <EditItemTemplate>
                                                                <asp:TextBox runat="server" Text='<%# Eval("FormName") %>' ID="txt_form_name" CssClass="form-control form-control-sm" />
                                                            </EditItemTemplate>
                                                            <ItemTemplate>
                                                                <asp:LinkButton Text='<%# Eval("FormName") %>' CommandName="Select" ID="lb_form_name" runat="server" />
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="Nhóm" ItemStyle-Width="20%" ItemStyle-CssClass="align-content-center">
                                                            <ItemTemplate>
                                                                <asp:DropDownList style="min-width: 100px;" OnSelectedIndexChanged="dr_group_DVDT_SelectedIndexChanged" CssClass="form-control form-control-sm" ID="dr_group_DVDT" runat="server" AutoPostBack="True">
                                                                </asp:DropDownList>
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                        <asp:TemplateField ItemStyle-CssClass="align-content-center" HeaderText="Cột" ItemStyle-VerticalAlign="Middle" ItemStyle-HorizontalAlign="Center">
                                                            <ItemTemplate>
                                                                <asp:DropDownList ID="dr_cot" style="min-width: 50px;" CssClass="form-control form-control-sm" runat="server" AutoPostBack="true" OnSelectedIndexChanged="dr_group_DVDT_SelectedIndexChanged" >
                                                                    <asp:ListItem Text="" />
                                                                    <asp:ListItem Text="1" />
                                                                    <asp:ListItem Text="2" />
                                                                    <asp:ListItem Text="3" />
                                                                </asp:DropDownList>
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="Sử dụng" ItemStyle-CssClass="align-content-center" ItemStyle-VerticalAlign="Middle" ItemStyle-HorizontalAlign="Center">
                                                            <ItemTemplate>
                                                                <asp:CheckBox Text="" ID="cb_show" AutoPostBack="true" OnCheckedChanged="cb_show_CheckedChanged2" runat="server" />
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="REPORT" ItemStyle-CssClass="align-content-center" ItemStyle-VerticalAlign="Middle" ItemStyle-HorizontalAlign="Center">
                                                            <ItemTemplate>
                                                                <asp:LinkButton CommandArgument='<%# Eval("FormID") %>' OnClick="btn_file_report_Click" ID="btn_file_report" CssClass="fas fa-file-import" runat="server"  />
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                        <asp:TemplateField Visible="false">
                                                            <ItemTemplate>
                                                                <asp:Label Text='<%# Eval("FormID") %>' ID="lb_id_form" runat="server" />
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                    </Columns>
                                                    <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle"  />
                                                </asp:GridView>
                                                    <asp:HiddenField ID="hfSelectedFormID" runat="server" />
                                                 <asp:FileUpload runat="server" ID="file_up_report" onchange="triggerFileUpload();" accept=".docx" style="display:none" />
                                                 <asp:Button ID="btnDummy" OnClick="btnDummy_Click" runat="server" Text="UploadDummy" Style="display:none;" />
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div runat="server" id="group_dvdt" visible="false">
                                        <div class="row mt-2">
                                            <div class="col-lg">
                                                <asp:TextBox runat="server" ID="txt_group_name" placeholder="Nhóm dịch vụ" CssClass="form-control form-control-sm" />
                                            </div>
                                            <div class="col-lg">
                                                <asp:LinkButton Text="Thêm" CssClass="btn btn-primary btn-sm" OnClick="btn_add_group_DVDT_Click" ID="btn_add_group_DVDT" runat="server" />
                                            </div>
                                        </div>
                                        <div class="row mt-2">
                                            <div class="col-lg">
                                                <asp:GridView ID="gv_GROUP_DVDT" runat="server" CssClass="table table-sm table-bordered" AutoGenerateColumns="False" DataKeyNames="GROUP_ID" DataSourceID="DB_GROUP_DVDT">
                                                    <Columns>
                                                        <asp:CommandField ShowEditButton="True" ShowDeleteButton="True"></asp:CommandField>
                                                        <asp:TemplateField HeaderText="STT" ItemStyle-Width="60" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center">
                                                            <ItemTemplate>
                                                                <%# Container.DataItemIndex + 1 %>
                                                            </ItemTemplate>
                                                            <ItemStyle HorizontalAlign="Center" />
                                                        </asp:TemplateField>
                                                        <asp:BoundField Visible="false" DataField="GROUP_ID" HeaderText="GROUP_ID" ReadOnly="True" InsertVisible="False" SortExpression="GROUP_ID"></asp:BoundField>
                                                        <asp:TemplateField HeaderText="Tên nhóm" ItemStyle-Width="80%" SortExpression="Group_Name">
                                                            <EditItemTemplate>
                                                                <asp:TextBox CssClass="form-control form-control-sm" runat="server" Text='<%# Bind("Group_Name") %>' ID="TextBox1"></asp:TextBox>
                                                            </EditItemTemplate>
                                                            <ItemTemplate>
                                                                <asp:Label runat="server" Text='<%# Bind("Group_Name") %>' ID="Label1"></asp:Label>
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                    </Columns>
                                                    <HeaderStyle CssClass="text-center" />
                                                </asp:GridView>
                                                <asp:SqlDataSource runat="server" ID="DB_GROUP_DVDT" ConflictDetection="CompareAllValues" ConnectionString='<%$ ConnectionStrings:SDHConnectionString %>' DeleteCommand="DELETE FROM [DVDT_PAGE] WHERE [GROUP_ID] = @original_GROUP_ID AND (([Group_Name] = @original_Group_Name) OR ([Group_Name] IS NULL AND @original_Group_Name IS NULL))" InsertCommand="INSERT INTO [DVDT_PAGE] ([Group_Name]) VALUES (@Group_Name)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [DVDT_PAGE] ORDER BY [Group_Name]" UpdateCommand="UPDATE [DVDT_PAGE] SET [Group_Name] = @Group_Name WHERE [GROUP_ID] = @original_GROUP_ID AND (([Group_Name] = @original_Group_Name) OR ([Group_Name] IS NULL AND @original_Group_Name IS NULL))">
                                                    <DeleteParameters>
                                                        <asp:Parameter Name="original_GROUP_ID" Type="Int32"></asp:Parameter>
                                                        <asp:Parameter Name="original_Group_Name" Type="String"></asp:Parameter>
                                                    </DeleteParameters>
                                                    <InsertParameters>
                                                        <asp:Parameter Name="Group_Name" Type="String"></asp:Parameter>
                                                    </InsertParameters>
                                                    <UpdateParameters>
                                                        <asp:Parameter Name="Group_Name" Type="String"></asp:Parameter>
                                                        <asp:Parameter Name="original_GROUP_ID" Type="Int32"></asp:Parameter>
                                                        <asp:Parameter Name="original_Group_Name" Type="String"></asp:Parameter>
                                                    </UpdateParameters>
                                                </asp:SqlDataSource>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </ContentTemplate>
                <Triggers>
                    <asp:PostBackTrigger ControlID="btnDummy" />
                </Triggers>
            </asp:UpdatePanel>
            <asp:UpdatePanel runat="server">
                <ContentTemplate>
                    <div class="row mt-2">
                        <div class="col">
                            <div class="card">
                                <div class="card-header">
                                    <asp:LinkButton Text="Liên kết Tra cứu" ID="btn_ql_LKTC" OnClick="btn_ql_LKTC_Click" runat="server" />
                                </div>
                                <div class="card-body " id="ql_LKTC" runat="server" visible="false">
                                    <div class="row mb-2">
                                        <div class="col-lg-5">
                                            <asp:TextBox runat="server" ID="txtNameFooter" CssClass="form-control" placeholder="Tên trang liên kết" />
                                        </div>
                                        <div class="col-lg-5">
                                            <asp:TextBox runat="server" ID="txtLinkFooter" CssClass="form-control" placeholder="URL liên kết" />
                                        </div>
                                        <div class="col-lg-2">
                                                    <asp:LinkButton Text="ADD" CssClass="btn btn-primary" OnClick="btn_add_lienket_Click" ID="btn_add_lienket" runat="server" />
                                        </div>
                                    </div>
                                    <asp:GridView CssClass="table table-sm mt-2 table-bordered" runat="server" 
                                        AutoGenerateColumns="False" ID="gv_lienket" DataKeyNames="id" DataSourceID="lienket_DB">
                                        <Columns>
                                            <asp:TemplateField ShowHeader="False" ItemStyle-Width="10%">
                                                <EditItemTemplate>
                                                    <asp:LinkButton runat="server" Text="Update" CommandName="Update" CausesValidation="True" ID="LinkButton1"></asp:LinkButton>
                                                </EditItemTemplate>
                                                <ItemTemplate>
                                                    <asp:LinkButton runat="server" Text="Edit" CommandName="Edit" CausesValidation="False" ID="LinkButton1"></asp:LinkButton>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField ItemStyle-Width="10%">
                                                <EditItemTemplate>
                                                    <asp:LinkButton runat="server" Text="Cancel" CommandName="Cancel" CausesValidation="False" ID="LinkButton2"></asp:LinkButton>
                                                </EditItemTemplate>
                                                <ItemTemplate>
                                                    <asp:LinkButton runat="server" Text="Delete" CommandName="Delete" CausesValidation="False" ID="LinkButton2"></asp:LinkButton>
                                                </ItemTemplate>
                                                
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="id" InsertVisible="False" Visible="false" SortExpression="id">
                                                <EditItemTemplate>
                                                    <asp:Label runat="server" Text='<%# Eval("id") %>' ID="Label1"></asp:Label>
                                                </EditItemTemplate>
                                                <ItemTemplate>
                                                    <asp:Label runat="server" Text='<%# Bind("id") %>' ID="Label1"></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="TRANG WEB" SortExpression="name">
                                                <EditItemTemplate>
                                                    <asp:TextBox runat="server" CssClass="form-control" Text='<%# Bind("name") %>' ID="txt_tenlienket"></asp:TextBox>
                                                </EditItemTemplate>
                                                <ItemTemplate>
                                                    <asp:Label runat="server" Text='<%# Bind("name") %>' ID="Label2"></asp:Label>
                                                </ItemTemplate>
                                               
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="URL LIÊN KẾT" SortExpression="link">
                                                <EditItemTemplate>
                                                    <asp:TextBox runat="server" CssClass="form-control" Text='<%# Bind("link") %>' ID="txt_link_lienket"></asp:TextBox>
                                                </EditItemTemplate>
                                                <ItemTemplate>
                                                    <asp:Label runat="server" Text='<%# Bind("link") %>' ID="Label3"></asp:Label>
                                                </ItemTemplate>
                                               
                                            </asp:TemplateField>

                                        </Columns>
                                    </asp:GridView>
                                    <asp:SqlDataSource runat="server" ID="lienket_DB" ConflictDetection="CompareAllValues" 
                                        ConnectionString='<%$ ConnectionStrings:SDHConnectionString %>' 
                                        DeleteCommand="DELETE FROM [LienKet_Table] WHERE [id] = @original_id AND (([name] = @original_name) OR ([name] IS NULL AND @original_name IS NULL)) AND (([link] = @original_link) OR ([link] IS NULL AND @original_link IS NULL))"
                                        InsertCommand="INSERT INTO [LienKet_Table] ([name], [link]) VALUES (@name, @link)" OldValuesParameterFormatString="original_{0}" 
                                        SelectCommand="SELECT * FROM [LienKet_Table] ORDER BY [name]" UpdateCommand="UPDATE [LienKet_Table] SET [name] = @name, [link] = @link WHERE [id] = @original_id AND (([name] = @original_name) OR ([name] IS NULL AND @original_name IS NULL)) AND (([link] = @original_link) OR ([link] IS NULL AND @original_link IS NULL))">
                                        <DeleteParameters>
                                            <asp:Parameter Name="original_id" Type="Int32"></asp:Parameter>
                                            <asp:Parameter Name="original_name" Type="String"></asp:Parameter>
                                            <asp:Parameter Name="original_link" Type="String"></asp:Parameter>
                                        </DeleteParameters>
                                        <InsertParameters>
                                            <asp:Parameter Name="name" Type="String"></asp:Parameter>
                                            <asp:Parameter Name="link" Type="String"></asp:Parameter>
                                        </InsertParameters>
                                        <UpdateParameters>
                                            <asp:Parameter Name="name" Type="String"></asp:Parameter>
                                            <asp:Parameter Name="link" Type="String"></asp:Parameter>
                                            <asp:Parameter Name="original_id" Type="Int32"></asp:Parameter>
                                            <asp:Parameter Name="original_name" Type="String"></asp:Parameter>
                                            <asp:Parameter Name="original_link" Type="String"></asp:Parameter>
                                        </UpdateParameters>
                                    </asp:SqlDataSource>
                                </div>
                            </div>
                        </div>
                    </div>
                </ContentTemplate>
            </asp:UpdatePanel>
        <asp:UpdatePanel runat="server">
            <ContentTemplate>
                <div class="row mt-2">
                    <div class="col">
                        <div class="card">
                            <div class="card-header">
                            </div>
                            <div class="card-body ">
                              
                            </div>
                        </div>
                    </div>
                </div>
            </ContentTemplate>
        </asp:UpdatePanel>
    </div>
    <asp:UpdatePanel runat="server">
        <ContentTemplate>
            <asp:SqlDataSource runat="server" ID="Ngang_group" ConflictDetection="CompareAllValues" ConnectionString='<%$ ConnectionStrings:SDHConnectionString %>' DeleteCommand="DELETE FROM [Nganh_Group] WHERE [id] = @original_id AND (([group_name] = @original_group_name) OR ([group_name] IS NULL AND @original_group_name IS NULL))"
                InsertCommand="INSERT INTO [Nganh_Group] ([group_name]) VALUES (@group_name)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [Nganh_Group] ORDER BY [group_name]"
                UpdateCommand="UPDATE [Nganh_Group] SET [group_name] = @group_name WHERE [id] = @original_id AND (([group_name] = @original_group_name) OR ([group_name] IS NULL AND @original_group_name IS NULL))">
                <DeleteParameters>
                    <asp:Parameter Name="original_id" Type="Int32"></asp:Parameter>
                    <asp:Parameter Name="original_group_name" Type="String"></asp:Parameter>
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="group_name" Type="String"></asp:Parameter>
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="group_name" Type="String"></asp:Parameter>
                    <asp:Parameter Name="original_id" Type="Int32"></asp:Parameter>
                    <asp:Parameter Name="original_group_name" Type="String"></asp:Parameter>
                </UpdateParameters>
            </asp:SqlDataSource>
        </ContentTemplate>
    </asp:UpdatePanel>
    <div class="modal fade" id="Modal_xoaTK" tabindex="-1" role="dialog"
        aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h4 class="modal-title text-primary">Xác nhận Xóa</h4>
                </div>
                <div class="modal-body text-center">
                    <asp:HiddenField    runat="server" ID="hd_taikhoan_xoa" />
                    <asp:Button Text="Xác nhận" CssClass="btn btn-primary" ID="btn_xoaTK"  runat="server" OnClick="btn_xoaTK_Click" />
                    <button class="btn btn-secondary" type="button" data-dismiss="modal">Đóng</button>
                </div>
            </div>
        </div>
    </div>
    <div class="modal fade" id="Modal_indent_FORM" tabindex="-1" role="dialog"
        aria-hidden="true">
        <div class="modal-dialog modal-xl" role="document">
            <div class="modal-content">
                <div class="modal-body text-center">
                    <asp:UpdatePanel runat="server">
                        <ContentTemplate>
                            <div class="container">
                                <p>Dữ liệu</p>
                                <asp:RadioButtonList AutoPostBack="true" runat="server" ID="rd_table_dulieu" CssClass="table table-sm table-borderless" OnSelectedIndexChanged="rd_table_dulieu_SelectedIndexChanged" RepeatLayout="Table" RepeatDirection="Horizontal">
                                    <asp:ListItem Text="HỌC VIÊN" />
                                    <asp:ListItem Text="FORM" />
                                    <asp:ListItem Text="HỌC TẬP" />
                                </asp:RadioButtonList>
                            </div>
                            <hr />
                            <div class="row">
                                <div class="col-lg-2">
                                    <div style="overflow: auto; max-height: 60vh">
                                        <asp:RadioButtonList runat="server" Style="text-align: left" Width="100%" RepeatLayout="Table" CssClass="table table-sm table-borderless " ID="rd_field_list">
                                        </asp:RadioButtonList>
                                    </div>
                                </div>
                                <div class="col-lg">
                                    <div style="overflow:auto;max-height: 60vh">
                                        <asp:GridView AutoGenerateColumns="false" ID="gv_field_mapping" OnRowDeleting="gv_field_mapping_RowDeleting" OnRowDataBound="gv_field_mapping_RowDataBound" CssClass="table table-sm table-bordered" runat="server">
                                            <Columns>
                                                <asp:TemplateField ItemStyle-Width="10%" FooterStyle-VerticalAlign="Middle" ItemStyle-HorizontalAlign="Center">
                                                    <ItemTemplate>
                                                        <asp:LinkButton ID="btn_delete_mapping" CommandName="Delete" Text="Xóa" CssClass="btn btn-danger" runat="server" />
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField ItemStyle-VerticalAlign="Middle" ItemStyle-HorizontalAlign="Center">
                                                    <ItemTemplate>
                                                        <asp:Label Text="" ID="lb_option" Visible="false" runat="server" />
                                                        <asp:Label Text="" ID="lb_idfield" Visible="false" runat="server" />
                                                        <asp:Label Text="" ID="lb_field" runat="server" />
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Từ khóa" ItemStyle-VerticalAlign="Middle">
                                                    <ItemTemplate>
                                                        <asp:TextBox ID="txt_mapping" runat="server" CssClass="form-control" placeholder="VD: <<HOTEN>>" />
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                            </Columns>
                                        </asp:GridView>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-lg-2">
                                    <asp:LinkButton CssClass="btn btn-info" OnClick="btn_chon_field_Click" Text="Chọn" ID="btn_chon_field" runat="server" />
                                </div>
                                <div class="col-lg">
                                </div>
                            </div>

                            
                        </ContentTemplate>
                    </asp:UpdatePanel>
                    
                    
                </div>
                <div class="modal-footer">

                            <div class="form-inline mr-auto">
                                <asp:Button Text="Xóa Report" CssClass="btn btn-danger" OnClick="btn_xoa_report_Click" ID="btn_xoa_report" runat="server" />
                            </div>
                            <asp:Button Text="Xác nhận" OnClick="btn_luu_Click" CssClass="btn btn-primary" ID="btn_luu" runat="server" />
                            <button class="btn btn-secondary" type="button" data-dismiss="modal">Đóng</button>

                </div>
            </div>
            
        </div>
    </div>
    <div class="modal fade" id="Modal_nganhGroup" tabindex="-1" role="dialog"
        aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h4 class="modal-title text-primary">Danh sách nhóm ngành</h4>
                </div>
                <div class="modal-body">
                    <asp:UpdatePanel runat="server">
                        <ContentTemplate>
                            <div class="overflow-auto" style="max-height:70vh">
                                <asp:GridView ID="gv_nhomnganh" runat="server" CssClass="table table-sm table-hover" AutoGenerateColumns="False" DataKeyNames="id" DataSourceID="Ngang_group">
                                    <Columns>
                                        <asp:TemplateField ShowHeader="False" ItemStyle-Width="20%">
                                            <EditItemTemplate>
                                                <asp:LinkButton runat="server" Text="Update" CommandName="Update" CausesValidation="True" ID="LinkButton1"></asp:LinkButton>
                                                <asp:LinkButton runat="server" Text="Cancel" CommandName="Cancel"
                                                    CausesValidation="False" ID="LinkButton2"></asp:LinkButton>
                                            </EditItemTemplate>
                                            <ItemTemplate>
                                                <asp:LinkButton runat="server" Text="Edit" CommandName="Edit" CausesValidation="False" ID="LinkButton1"></asp:LinkButton>
                                                <asp:LinkButton runat="server" Text="Delete" CommandName="Delete"
                                                    CausesValidation="False" ID="LinkButton2"></asp:LinkButton>
                                            </ItemTemplate>
                                        </asp:TemplateField>

                                        <asp:BoundField DataField="id" Visible="false" HeaderText="id" ReadOnly="True" InsertVisible="False" SortExpression="id"></asp:BoundField>
                                        <asp:TemplateField HeaderText="Nhóm ngành"  SortExpression="group_name">
                                            <EditItemTemplate>
                                                <asp:TextBox runat="server" CssClass="form-control form-control-sm" Text='<%# Bind("group_name") %>' ID="TextBox1"></asp:TextBox>
                                            </EditItemTemplate>
                                            <ItemTemplate>
                                                <asp:Label runat="server" Text='<%# Bind("group_name") %>' ID="Label1"></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>


                                    </Columns>
                                </asp:GridView>
                                
                            </div>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                </div>
                <div class="modal-footer">
                    <asp:UpdatePanel runat="server">
                        <ContentTemplate>
                            <div class="row">
                                <div class="col-lg">
                                    <asp:TextBox runat="server" CssClass="form-control " placeholder="Nhóm ngành mới" ID="txt_add_nganhGroup" />
                                </div>
                                <div class="col-lg">
                                    <asp:Button Text="Xác nhận" CssClass="btn btn-primary" ID="btn_them_nhom_group" OnClick="btn_them_nhom_group_Click" runat="server" />
                                    <button class="btn btn-secondary" type="button" data-dismiss="modal">Đóng</button>
                                </div>
                            </div>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                </div>
            </div>
        </div>
    </div>
    
    <div class="modal fade" id="Modal_change_bv" tabindex="-1" role="dialog"
        aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h4 class="modal-title text-primary">Đổi danh mục cha</h4>
                </div>
                <div class="modal-body text-center">
                    <asp:UpdatePanel runat="server">
                        <ContentTemplate>
                            <asp:HiddenField runat="server" ID="id_change" />
                            <div class="row ">
                                <div class="col-lg-6">
                                    Tiêu đề
                                    <asp:TextBox runat="server" CssClass="form-control form-control-sm mb-2" ID="txt_doiten_nav" />
                                </div>
                                <div class="col-lg-6">
                                    Thứ tự sắp xếp
                                    <asp:TextBox TextMode="Number" min="0" runat="server" CssClass="form-control form-control-sm mb-2" ID="txt_doistt" />
                                </div>
                            </div>
                            <asp:DropDownList runat="server" ID="dr_change_bv" CssClass="select">
                            </asp:DropDownList>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                </div>
                <div class="modal-footer">
                    <asp:UpdatePanel runat="server">
                        <ContentTemplate>
                            <asp:Button Text="Xác nhận" CssClass="btn btn-primary" ID="btn_change_danhmuc" runat="server" OnClick="btn_change_danhmuc_Click" />
                            <button class="btn btn-secondary" type="button" data-dismiss="modal">Đóng</button>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                            
                    
                </div>

            </div>
        </div>
    </div>
    <div class="modal fade" id="Modala_taotk" tabindex="-1" role="dialog"
        aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h4 class="modal-title text-primary">Thêm tài khoản</h4>

                </div>
                <div class="modal-body text-center">
                    <div class="row">
                        <div class="col-3">
                            Tài khoản
                        </div>
                        <div class="col">
                            <asp:TextBox runat="server" ID="txt_themtk" CssClass="form-control" />
                        </div>
                    </div>
                    <div class="row mt-2">
                        <div class="col-3">
                            Mật khẩu
                        </div>
                        <div class="col">
                            <asp:TextBox runat="server" ID="txt_themmk" TextMode="Password" CssClass="form-control" />
                        </div>
                    </div>
                    <div class="row mt-2">
                        <div class="col-3">
                            Tên người dùng
                        </div>
                        <div class="col">
                            <asp:TextBox runat="server" ID="txt_ngdung" CssClass="form-control" />
                        </div>
                    </div>
                    <div class="row mt-2">
                        <div class="col-3">
                            Quyền
                        </div>
                        <div class="col">
                            <asp:DropDownList runat="server" CssClass="form-control" ID="dr_pquyen">
                            </asp:DropDownList>
                        </div>
                    </div>
                    <asp:Label ID="LB_TB" CssClass="text-danger" runat="server"></asp:Label>
                </div>
                <div class="modal-footer">
                    <asp:UpdatePanel runat="server">
                        <ContentTemplate>
                            <asp:Button Text="Xác nhận" ID="btn_themtk" CssClass="btn btn-primary" runat="server" OnClick="btn_themtk_Click" />
                        </ContentTemplate>
                    </asp:UpdatePanel>
                    <button class="btn btn-secondary" type="button" data-dismiss="modal">Đóng</button>
                </div>
            </div>
        </div>
    </div>
    <div class="modal fade" id="Modal_suaBV" tabindex="-1" role="dialog" aria-hidden="true">
        <div class="modal-dialog modal-xl" role="document">
            <div class="modal-content">
                <div class="modal-body text-center">
                    <asp:HiddenField runat="server" ID="hd_id_baisua" />
                    <div class="custom-file custom-file-sm">
                        <asp:FileUpload class="custom-file-input" AllowMultiple="true" runat="server" ID="reup_file_pdf" accept=".pdf" />
                        <label class="custom-file-label">File PDF đính kèm nếu có (hiển thị cuối nội dung bên dưới)</label>
                    </div>
                    <textarea id="note_sua" class="summernote"></textarea>
                </div>
                <div class="modal-footer">
                    <asp:UpdatePanel runat="server">
                        <ContentTemplate>
                            <asp:Button Text="Xác nhận" OnClientClick="read_data();" CssClass="btn btn-primary" ID="btn_luubaisua" OnClick="btn_luubaisua_Click" runat="server" />
                        </ContentTemplate>
                    </asp:UpdatePanel>
                    <button class="btn btn-secondary" type="button" data-dismiss="modal">Đóng</button>
                </div>
            </div>
        </div>
    </div>
    <div class="modal " id="Modal_create_Folder" tabindex="-1" role="dialog" aria-hidden="true">
        <div class="modal-dialog " role="document">
            <div class="modal-content">
                <div class="modal-body text-center">
                    <asp:UpdatePanel runat="server">
                        <ContentTemplate>
                            <asp:TextBox runat="server" placeholder="Tên thư mục" CssClass="form-control" ID="txt_Folder_name" />
                        </ContentTemplate>
                    </asp:UpdatePanel>
                </div>
                <div class="modal-footer">
                    <asp:UpdatePanel runat="server">
                        <ContentTemplate>
                            <asp:LinkButton Text="Xác nhận" CssClass="btn btn-primary" ID="btn_create_Folder" OnClick="btn_create_Folder_Click" runat="server" />
                        </ContentTemplate>
                    </asp:UpdatePanel>
                    <button class="btn btn-secondary" type="button" data-dismiss="modal">Đóng</button>
                </div>
            </div>
        </div>
    </div>
    <div class="modal " id="Modal_FileSever" tabindex="-1" role="dialog" >
        <div class="modal-dialog modal-xl" role="document">
            <div class="modal-content">
                <div class="modal-body text-center">
                    <asp:UpdatePanel runat="server">
                        <ContentTemplate>

                    <asp:LinkButton Text="Kết nối dữ liệu" ID="btn_connect_file"  OnClick="btn_connect_file_Click" CssClass="btn btn-primary" runat="server" />
                    <asp:LinkButton Text="" ID="btn_back_folder" OnClick="btn_back_folder_Click" runat="server" />
                        <div class="row" >
                        <div class="col-lg" style="overflow:auto;max-height:70vh">
                            <asp:ListView ID="lv_choose_file" OnDataBound="lv_choose_file_DataBound" runat="server" 
                                OnItemDataBound="lv_choose_file_ItemDataBound" ItemPlaceholderID="pl_itemTemplate">
                                <LayoutTemplate>
                                    <table class="table table-sm table-hover table-borderless">
                                        <tr>
                                            <td>
                                                <asp:Label Text="" ID="lb_thumuc" runat="server" />
                                            </td>
                                        </tr>
                                        <asp:PlaceHolder runat="server" ID="pl_itemTemplate" />
                                    </table>
                                </LayoutTemplate>
                                <ItemTemplate>
                                    <tr>
                                        <td>
                                            <div class="text-break" style="display: flex">
                                                <asp:LinkButton Text="" ID="btn_choose" OnClick="btn_choose_Click" Font-Underline="false"  CssClass="fas fa-plus-circle mr-2 ml-2 text-success" runat="server" />
                                                <asp:LinkButton Text="" OnClick="btn_file_Folder_Click" ID="btn_file_Folder" Visible="false" CssClass="" runat="server" />
                                                <asp:LinkButton Text="" OnClick="btn_file_OpenFile_Click" ID="btn_file_OpenFile"  Visible="false" CssClass="" runat="server" />
                                                <asp:LinkButton Text="" ID="btn_copylink" Visible="false" CssClass="ml-auto fas fa-link" runat="server" />
                                            </div>

                                        </td>
                                    </tr>
                                </ItemTemplate>
                                <EmptyItemTemplate>
                                    <div class="col-lg-6 mt-2">
                                    </div>
                                </EmptyItemTemplate>
                            </asp:ListView>
                        </div>
                        <div class="col-lg-3" style="overflow:auto;max-height:70vh;">
                            <div class="text-center">Danh sách file chọn</div>
                            <asp:ListView ID="lv_ds_file_chon" OnItemDataBound="lv_ds_file_chon_ItemDataBound" ItemPlaceholderID="pl_data" runat="server">
                                <LayoutTemplate>
                                    <table class="table table-sm">
                                        <asp:PlaceHolder runat="server" ID="pl_data" />
                                    </table>
                                </LayoutTemplate>
                                <ItemTemplate>
                                    <tr class="row">
                                        <td class="col-lg">
                                            <div class="text-break" style="display: flex">
                                                <asp:LinkButton ID="btn_remove_choose" 
                                                    OnClick="btn_remove_choose_Click" Text="" 
                                                    CommandArgument='<%# Eval("FullPath") %>' CssClass="mr-2 far fa-trash-alt text-danger" runat="server" />
                                                <asp:LinkButton ID="btn_file_chon" Enabled="false" CommandArgument='<%# Eval("FullPath") %>'
                                                    Text='<%# Eval("fileName") %>' runat="server" />
                                            </div>
                                        </td>
                                    </tr>
                                </ItemTemplate>
                            </asp:ListView>
                        </div>
                    </div>
                            
                        </ContentTemplate>
                    </asp:UpdatePanel>
                </div>
                <div class="modal-footer">
                    <asp:UpdatePanel runat="server">
                        <ContentTemplate>
                            <asp:LinkButton Text="Xác nhận" OnClientClick="closeModal_FILESV();" 
                                ID="btn_choosed" CssClass="btn btn-primary" OnClick="btn_choosed_Click" runat="server" />
                        </ContentTemplate>
                    </asp:UpdatePanel>
                    <button class="btn btn-secondary" type="button" data-dismiss="modal">Đóng</button>
                </div>
            </div>
        </div>
    </div>
    <div class="modal fade" id="Modal_nganhBSKT" tabindex="-1" role="dialog" aria-hidden="true">
        <div class="modal-dialog modal-lg" role="document">
            <div class="modal-content">
                <div class="modal-body text-center">
                    <asp:UpdatePanel runat="server">
                        <ContentTemplate>

                    <asp:GridView runat="server" CssClass="table table-sm table-hover table-bordered" OnRowDataBound="gv_dsbskt_RowDataBound" ID="gv_dsbskt" AutoGenerateColumns="False" >
                        <Columns>
                            <asp:TemplateField HeaderText="Ngành học" ItemStyle-HorizontalAlign="Center" ItemStyle-VerticalAlign="Middle">
                                <ItemTemplate>
                                    <asp:Label runat="server" Visible="false" ID="lb_id"></asp:Label>
                                    <asp:Label runat="server" ID="lb_tennganh"></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Ngành bổ sung">
                                <ItemTemplate>
                                    <asp:ListView runat="server" OnItemDataBound="lv_nganhbskt_ItemDataBound"  ID="lv_nganhbskt">
                                        <ItemTemplate>
                                            <div class="d-flex justify-content-between">
                                                <asp:Label ID="lb_tennganhbs" Text="text" runat="server" />
                                                <asp:LinkButton id="btn_xoanganhbs" OnClick="btn_xoanganhbs_Click" CssClass="far fa-trash-alt text-danger" runat="server" />
                                            </div>
                                        </ItemTemplate>
                                    </asp:ListView>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Kiến thức BS" ItemStyle-HorizontalAlign="Center" ItemStyle-VerticalAlign="Middle">
                                <ItemTemplate>
                                    <asp:Label runat="server" ID="lb_noidung"></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>

                        </Columns>
                    </asp:GridView>
                    
                        </ContentTemplate>
                    </asp:UpdatePanel>
                </div>
            </div>
        </div>
    </div>
    <div class="modal fade" id="Modal_nganhTS" tabindex="-1" role="dialog" aria-hidden="true">
    <div class="modal-dialog modal-lg" role="document">
        <div class="modal-content">
            <div class="modal-body text-center">
                <div style="max-height:70vh; overflow:auto">

                <asp:UpdatePanel runat="server">
                    <ContentTemplate>
                        <asp:CheckBoxList ID="cb_ds_nganhts" ItemStyle-HorizontalAlign="Left" RepeatLayout="Table" style="text-align: left" OnSelectedIndexChanged="cb_ds_nganhts_SelectedIndexChanged" 
                            AutoPostBack="true" runat="server">
                        </asp:CheckBoxList>
                    </ContentTemplate>
                </asp:UpdatePanel>
                </div>
            </div>
        </div>
    </div>
</div>
    <div class="modal fade" id="Modal_prossesing" tabindex="-1" role="dialog" aria-hidden="true">
        <div class="modal-dialog modal-lg" role="document">
            <div class="modal-content">
                <div class="modal-body text-center">
                    <div style="max-height: 70vh; overflow: auto">
                        <asp:UpdatePanel runat="server">
                            <ContentTemplate>
                                <asp:Label Text="Đang thực thi...." ID="lb_thucthi" runat="server" />
                            </ContentTemplate>
                        </asp:UpdatePanel>
                    </div>
                </div>
                <div class="modal-footer">
                    <asp:LinkButton Text="Đóng" ID="btn_dongmodal" data-dismiss="modal" class="btn btn-secondary" runat="server" />
                </div>
            </div>
        </div>
    </div>
    <div class="modal fade" id="Modal_phongbaove" tabindex="-1" role="dialog" aria-hidden="true">
    <div class="modal-dialog modal-lg" role="document">
        <div class="modal-content">
            <div class="modal-body text-center">
                <asp:UpdatePanel runat="server">
                    <ContentTemplate>
                        <asp:Panel runat="server" DefaultButton="btn_themphong">

                        <div class="row mb-2">
                            <div class="col-lg mt-2">
                                            <asp:TextBox CssClass="form-control" placeholder="Phòng" runat="server" ID="txt_phong"></asp:TextBox>
                            </div>
                            <div class="col-lg mt-2">
                                            <asp:TextBox CssClass="form-control" placeholder="Địa chỉ" runat="server" ID="txt_diachiPhong"></asp:TextBox>
                            </div>
                            <div class="col-lg-2 mt-2">
                                <asp:LinkButton Text="Thêm" CssClass="btn btn-primary" ID="btn_themphong" OnClick="btn_themphong_Click" runat="server" />
                            </div>
                        </div>
                        </asp:Panel>
                        <div style="max-height: 70vh; overflow: auto">
                            <asp:GridView runat="server" ID="gv_phongHDBV" CssClass="table table-sm table-bordered " AutoGenerateColumns="False" 
                                DataKeyNames="id" DataSourceID="PhongHDBV" AllowPaging="True">
                                <Columns>
                                    <asp:TemplateField ShowHeader="False">
                                        <EditItemTemplate>
                                            <asp:LinkButton runat="server" Text="Update" CommandName="Update" CausesValidation="True" ID="LinkButton1"></asp:LinkButton>&nbsp;
                                            <asp:LinkButton runat="server" Text="Cancel" CommandName="Cancel" CausesValidation="False" ID="LinkButton2"></asp:LinkButton>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:LinkButton runat="server" Text="Edit" CommandName="Edit" CausesValidation="False" ID="LinkButton1"></asp:LinkButton>&nbsp;
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                    <asp:BoundField DataField="id" Visible="false" HeaderText="id" ReadOnly="True" InsertVisible="False" SortExpression="id"></asp:BoundField>
                                    <asp:TemplateField HeaderText="Phòng" SortExpression="phong">
                                        <EditItemTemplate>
                                            <asp:TextBox CssClass="form-control" runat="server" Text='<%# Bind("phong") %>' ID="TextBox1"></asp:TextBox>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label runat="server" Text='<%# Bind("phong") %>' ID="Label1"></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Địa chỉ phòng" SortExpression="diachi">
                                        <EditItemTemplate>
                                            <asp:TextBox runat="server" Text='<%# Bind("diachi") %>' CssClass="form-control"  ID="TextBox2"></asp:TextBox>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label runat="server" Text='<%# Bind("diachi") %>' ID="Label2"></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField>
                                        <ItemTemplate>
                                            <asp:LinkButton runat="server" Text="Delete" CommandName="Delete" CausesValidation="False" ID="LinkButton2"></asp:LinkButton>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                </Columns>
                            </asp:GridView>
                            
                        </div>

                    </ContentTemplate>
                </asp:UpdatePanel>
            </div>
            <div class="modal-footer">
                <asp:LinkButton Text="Đóng" ID="LinkButton9" data-dismiss="modal" class="btn btn-secondary" runat="server" />
            </div>
        </div>
    </div>
</div>
    <script>
        function open_modal_sua(id) {
            $('#' + id).modal({ backdrop: 'static' });
        }
        function openModal_nganhTS() {
            $('#Modal_nganhTS').modal();
        } 
        function openModal_phongbaove() {
            $('#Modal_phongbaove').modal();
        }
        function openModal_suaBV() {
            $('#Modal_suaBV').modal();
        }
        function closeModal_FILESV() {
            $('#Modal_FileSever').modal('hide');
        }
        function openModal_FILESV() {
            $('#Modal_FileSever').modal();
        }
        function openModal_xoatk() {
            $('#Modal_xoaTK').modal();
        }
        function openModal_dsbskt() {
            $('#Modal_nganhBSKT').modal();
        }
        function openModal_change_bv() {
            $('#Modal_change_bv').modal();
        }
        function openModal_nganhGroup() {
            $('#Modal_nganhGroup').modal();
        }
        function openModal_indent_FORM() {
            $('#Modal_indent_FORM').modal();
        }
        function validateAndShowModal(id) {
            var form = document.forms[0]; // form ASP.NET mặc định
            if (form.checkValidity()) {
                $('#' + id +'').modal({ backdrop: 'static', keyboard: false });
                return true; // không postback ngay
            } else {
                form.reportValidity(); // hiển thị lỗi required
                return false;
            }
        }
        function read_summernote_tb() {
            var header = document.getElementById('<%= txt_header_tb.ClientID%>');
            var hd = document.getElementById('<%= pl_summer.ClientID%>');

            if (header.value == "") {
                header.style.borderColor = "red";
                return false;
            }

            header.style.borderColor = null;
            hd.value = $('#note_tb').summernote('code');
        }
        function read_summernote_tbbv() {
            var header = document.getElementById('<%= txt_header_tblichbv.ClientID%>');
            var hd = document.getElementById('<%= hd_lichbv.ClientID%>');

            if (header.value == "") {
                header.style.borderColor = "red";
                return false;
            }

            header.style.borderColor = null;
            hd.value = $('#note_tbbv').summernote('code');
        }
        function read_summernote_mota_form() {
            var hd = document.getElementById('<%= hd_note_mota_form.ClientID%>');

            hd.value = $('#note_mota_form').summernote('code');
        }
        function read_summer_footer() {
            var hd = document.getElementById('<%= hd_footernote.ClientID%>');
            hd.value = $('#footer_note').summernote('code');
        }
        function read_summernote_tt() {
            var header = document.getElementById('<%= txt_header_tt.ClientID%>');
            var hd = document.getElementById('<%= hd_tt.ClientID%>');

            if (header.value == "") {
                header.style.borderColor = "red";
                return false;
            }

            header.style.borderColor = null;
            hd.value = $('#note_tt').summernote('code');
        }
        function read_summernote_ts() {
            var header = document.getElementById('<%= txt_header_ts.ClientID%>');
            var hd = document.getElementById('<%= hd_ts.ClientID%>');

            if (header.value == "") {
                header.style.borderColor = "red";
                return false;
            }

            header.style.borderColor = null;
            hd.value = $('#note_ts').summernote('code');
        }
        function read_summernote_NCS() {
            var header = document.getElementById('<%= TXT_HEADER_NCS.ClientID%>');
            var hd = document.getElementById('<%= HD_NCS.ClientID%>');

            if (header.value == "") {
                header.style.borderColor = "red";
                return false;
            }

            header.style.borderColor = null;
            hd.value = $('#note_NCS').summernote('code');
        }

        function read_summernote_caohoc() {
            var header = document.getElementById('<%= txt_header_cahoc.ClientID%>');
            var hd = document.getElementById('<%= hd_caohoc.ClientID%>');

            if (header.value == "") {
                header.style.borderColor = "red";
                return false;
            }

            header.style.borderColor = null;
            hd.value = $('#note_caohoc').summernote('code');
        }
        function read_summernote_CK2() {
            var header = document.getElementById('<%= TXT_HEADER_CK2.ClientID%>');
            var hd = document.getElementById('<%= HD_CK2.ClientID%>');

            if (header.value == "") {
                header.style.borderColor = "red";
                return false;
            }

            header.style.borderColor = null;
            hd.value = $('#note_CK2').summernote('code');
        }


        function read_summernote_bv() {
            var header = document.getElementById('<%= txt_header_bv.ClientID%>');
            var hd = document.getElementById('<%= hd_bv.ClientID%>');

            if (header.value == "") {
                header.style.borderColor = "red";
                openModalalert('Điền tiêu đề bài viết');
                return false;
            }

            header.style.borderColor = null;
            hd.value = $('#note_bv').summernote('code');
            return confirm('Lưu bài sẽ ghi đè lên nội dung hiện có!!! Có xác nhận lưu?');
        }
        function remove_file() {
            return confirm('Xác nhận xóa? Nếu là thư mục sẽ xóa toàn bộ dung bên trong!!!');
        }
        <%--function read_summernote_bskt() {
            var hd = document.getElementById('<%= .ClientID%>');

            hd.value = $('#note_bskt').summernote('code');
            return confirm('Lưu sẽ ghi đè lên nội dung hiện có!!! Có xác nhận lưu?');
        }--%>
        function copy_link(link) {
            console.log(link);
            navigator.clipboard.writeText(link);
        }
        function set_data(id, data) {

            summernoteData[id] = data;
            $('#' + id).summernote('code', data);
        }
        function read_data() {
            var hd = document.getElementById('<%= hd_id_baisua.ClientID%>');

            hd.value = $('#note_sua').summernote('code');
        }
        function toggleDropdown() {
            var dropdownContent = document.querySelector('.dropdown-content');
            if (dropdownContent.style.display === 'block') {
                dropdownContent.style.display = 'none';
            } else {
                dropdownContent.style.display = 'block';
            }
        }
        function open_file_load() {
            var d = document.getElementById("ContentPlaceHolder1_ql_file");
            if (d != null) {
            } else {
                openModalalert('Đang kết nối');
            }
        }
        function read_file_input(ev) {
            Array.from(ev.files).forEach(file => {
            });
        }
        function triggerFileUpload() {
            document.getElementById('<%= btnDummy.ClientID %>').click();
        }
    </script>
    <%--xử lý file--%>
    <script>

        $(".custom-file-input").on("change", function () {
            var fileName = $(this).val().split("\\").pop();
            $(this).siblings(".custom-file-label").addClass("selected").html(fileName);
            console.log("selected")
        });
        $(document).ready(function () {
            $(document).on('keydown', function (e) {
                if (e.keyCode === 9) { // Nếu phím ấn là Enter
                    e.preventDefault(); // Ngăn chặn hành động mặc định của tab
                }
            });
        });

    </script>
</asp:Content>
