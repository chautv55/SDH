<%@ Control Language="C#" CodeBehind="INFO_USER.ascx.cs" Inherits="SDH_VICTORY.DynamicData.FieldTemplates.INFO_USER" %>

<asp:ListView ID="FormView_info" runat="server" ItemPlaceholderID="pl_info">
    <LayoutTemplate>
        <div class="card">
            <div class="card-header bg-primary text-white text-center">
                THÔNG TIN CÁ NHÂN
            </div>
            <div class="card-body">
                <asp:UpdatePanel runat="server">
                    <ContentTemplate>
                        <asp:PlaceHolder runat="server" ID="pl_info"></asp:PlaceHolder>
                    </ContentTemplate>
                </asp:UpdatePanel>
            </div>
        </div>
    </LayoutTemplate>
    <EmptyItemTemplate>
        <div class="row">
            <div class="col-lg-3 mb-2">
                <span class="">Họ tên</span>
                <asp:TextBox runat="server" ID="txt_suahoten" required="true" CssClass="form-control" />
            </div>
            <div class="col-lg-3 mb-2">
                <span class="">Giới tính</span>
                <asp:TextBox runat="server" ID="txt_suagt"  CssClass="form-control"  />
            </div>
            <div class="col-lg-3 mb-2">
                <span class="">Ngày sinh</span>
                <asp:TextBox runat="server" ID="txt_suangaysinh"  CssClass="form-control" TextMode="Date" />
            </div>
            <div class="col-lg-3 mb-2">
                <span class="">Nơi sinh</span>
                <asp:TextBox runat="server" ID="txt_suanoisinh"  CssClass="form-control" />
            </div>
        </div>
        <div class="row">
            <div class="col-lg-3 mb-2">
                <span class="">CCCD</span>
                <asp:TextBox runat="server" ID="txt_suacccd" required="true" CssClass="form-control"  />
            </div>
            <div class="col-lg-3 mb-2">
                <span class="">Ngày cấp</span>
                <asp:TextBox TextMode="Date" ID="txt_suangaycap"  runat="server" CssClass="form-control"
                    />
            </div>
            <div class="col-lg-3 mb-2">
                <span class="">Nơi cấp</span>
                <asp:TextBox runat="server" ID="txt_suanoicap"  CssClass="form-control"/>
            </div>
            <div class="col-lg-3 mb-2">
                <span class="">Cơ quan</span>
                <asp:TextBox runat="server" ID="txt_suacoquan" CssClass="form-control"  />
            </div>
        </div>
        <div class="row">
            <div class="col-lg-3 mb-2">
                <span class="">SĐT</span>
                <asp:TextBox TextMode="Phone" ID="txt_suasdt" runat="server" required="true" CssClass="form-control"  />
            </div>
            <div class="col-lg-3 mb-2">
                <span class="">Email</span>
                <asp:TextBox runat="server" ID="txt_suaemail" TextMode="Email" required="true" CssClass="form-control"  />
            </div>
            <div class="col-lg-3 mb-2">
                <span class="">Địa chỉ</span>
                <asp:TextBox runat="server" ID="txt_suadiachi" TextMode="MultiLine" CssClass="form-control" />
            </div>
            <div class="col-lg-3 mb-2">
                <asp:LinkButton Text="Lưu" ID="btn_save" OnClick="btn_save_Click" CssClass="btn btn-primary" runat="server" />
                <asp:Button Text="Hủy" UseSubmitBehavior="false" ID="btn_cancel" OnClick="btn_cancel_Click" CssClass="btn btn-danger" runat="server" />
            </div>
        </div>
    </EmptyItemTemplate>
    <ItemTemplate>
        <div class="card mt-5">
            <div class="card-body">
                <div class="section-title mt-n5 d-flex ">
                    <p class="bg-white">Thông tin liên hệ</p>
                </div>
                <div class="row">
                    <div class="col-lg-4 mb-2">
                        <span class="">Họ tên</span>
                        <asp:TextBox runat="server" ID="txt_suahoten" required="true" CssClass="form-control" Text='<%# Eval("hoten") %>' />
                    </div>
                    <div class="col-lg-4 mb-2">
                        <span class="">Giới tính</span>
                        <asp:TextBox runat="server" ID="txt_suagt" CssClass="form-control" Text='<%# Eval("gioitinh") %>' />
                    </div>
                    <div class="col-lg-4 mb-2">
                        <span class="">Ngày sinh</span>
                        <asp:TextBox runat="server" ID="txt_suangaysinh" CssClass="form-control" TextMode="Date" Text='<%# Eval("NS")!=null? DateTime.Parse( Eval("NS").ToString()).ToString("yyyy-MM-dd"):"" %>' />
                    </div>
                    <div class="col-lg-4 mb-2">
                        <span class="">Nơi sinh</span>
                        <asp:TextBox runat="server" ID="txt_suanoisinh" CssClass="form-control" Text='<%# Eval("Noisinh") %>' />
                    </div>
                    <div class="col-lg-4 mb-2">
                        <span class="">CCCD</span>
                        <asp:TextBox runat="server" ID="txt_suacccd" required="true" CssClass="form-control" Text='<%# Eval("CCCD") %>' />
                    </div>
                    <div class="col-lg-4 mb-2">
                        <span class="">Ngày cấp</span>
                        <asp:TextBox TextMode="Date" ID="txt_suangaycap" required="true" runat="server" CssClass="form-control"
                            Text='<%# Eval("ngaycap")!=null?  DateTime.Parse(Eval("ngaycap").ToString()).ToString("yyyy-MM-dd"):""  %>' />
                    </div>
                    <div class="col-lg-4 mb-2">
                        <span class="">Nơi cấp</span>
                        <asp:TextBox runat="server" ID="txt_suanoicap" CssClass="form-control" Text='<%# Eval("noicap") %>' />
                    </div>
                    <div class="col-lg-4 mb-2">
                        <span class="">Cơ quan</span>
                        <asp:TextBox runat="server" ID="txt_suacoquan" CssClass="form-control" Text='<%# Eval("Coquan") %>' />
                    </div>
                    <div class="col-lg-4 mb-2">
                        <span class="">SĐT</span>
                        <asp:TextBox TextMode="Phone" ID="txt_suasdt" runat="server" required="true" CssClass="form-control" Text='<%# Eval("sdt") %>' />
                    </div>
                    <div class="col-lg-4 mb-2">
                        <span class="">Email</span>
                        <asp:TextBox runat="server" ID="txt_suaemail" TextMode="Email" required="true" CssClass="form-control" Text='<%# Eval("Email") %>' />
                    </div>
                    <div class="col-lg-8 mb-2">
                        <span class="">Địa chỉ</span>
                        <asp:TextBox runat="server" ID="txt_suadiachi" CssClass="form-control" Text='<%# Eval("diachi") %>' />
                    </div>
                </div>
            </div>
        </div>
        <div class="card mt-5 ">
            <div class="card-body">
                <div class="section-title mt-n5 d-flex ">
                    <p class="bg-white">Chuyên môn & khen thưởng - kỷ luật</p>
                </div>
                <asp:UpdatePanel runat="server">
                    <ContentTemplate>
                        <div class="row">
                            <div class="col-lg-4 mb-2">
                                <span class="">Đại học ngành</span>
                                <asp:TextBox runat="server" ID="txt_daihoc" CssClass="form-control" />
                               <%-- <asp:DropDownList ID="dr_nhomnganh" AutoPostBack="true" CssClass="select" runat="server" DataSourceID="nhom_nganhDB" DataTextField="group_name"
                                    DataValueField="id">
                                </asp:DropDownList>
                                <asp:SqlDataSource runat="server" ID="nhom_nganhDB" ConnectionString='<%$ ConnectionStrings:SDHConnectionString %>' SelectCommand="SELECT * FROM [Nganh_Group] ORDER BY [group_name]">
                                </asp:SqlDataSource>--%>
                            </div>
                            <div class="col-lg-4 mb-2">
                                <span class="">Chuyên ngành</span>
                                <asp:TextBox runat="server" ID="txt_chuyennganh" CssClass="form-control" />
                                <%--<asp:DropDownList ID="dr_chuyennganh" CssClass="select" runat="server" DataSourceID="NganhDB" DataTextField="ten_nganh" DataValueField="id">
                                </asp:DropDownList>
                                <asp:SqlDataSource runat="server" ID="NganhDB" ConnectionString='<%$ ConnectionStrings:SDHConnectionString %>' SelectCommand="SELECT * FROM [Nganh] WHERE ([id_group] = @id_group) ORDER BY [ten_nganh]">
                                    <SelectParameters>
                                        <asp:ControlParameter ControlID="dr_nhomnganh" PropertyName="SelectedValue" DefaultValue="0" Name="id_group" Type="Int32"></asp:ControlParameter>
                                    </SelectParameters>
                                </asp:SqlDataSource>--%>
                            </div>
                            <div class="col-lg-4 mb-2">
                                <span class="">Năm Tốt nghiệp</span>
                                <asp:TextBox runat="server" TextMode="Number" ID="txt_totnghiep" CssClass="form-control" />
                            </div>
                            <div class="col-lg-6 mb-2">
                                <span class="">Khen thưởng</span>
                                <asp:TextBox runat="server" ID="txt_khenthuong" CssClass="form-control" />
                            </div>

                            <div class="col-lg-6 mb-2">
                                <span class="">Kỷ luật</span>
                                <asp:TextBox runat="server" ID="txt_kyluat" CssClass="form-control" />
                            </div>
                        </div>
                    </ContentTemplate>
                </asp:UpdatePanel>
            </div>
        </div>
        <div class="card mt-5 ">
            <div class="card-body">
                <div class="section-title mt-n5 d-flex ">
                    <p class="bg-white">Quan hệ</p>
                </div>
                <div class="row">
                    <div class="col-lg-4 mb-2">
                        <span class="">Họ tên Cha</span>
                        <asp:TextBox runat="server" ID="txt_hotencha" CssClass="form-control" />
                    </div>
                    <div class="col-lg-4 mb-2">
                        <span class="">Dân tộc Cha</span>
                        <asp:TextBox runat="server" ID="txt_dt_cha" CssClass="form-control" />
                    </div>
                    <div class="col-lg-4 mb-2">
                        <span class="">Năm sinh Cha</span>
                        <asp:TextBox runat="server" ID="txt_ns_cha" TextMode="Number" CssClass="form-control" />
                    </div>
                    <div class="col-lg-4 mb-2">
                        <span class="">Họ tên Mẹ</span>
                        <asp:TextBox runat="server" ID="txt_hotenme" CssClass="form-control" />
                    </div>
                    <div class="col-lg-4 mb-2">
                        <span class="">Dân tộc Mẹ</span>
                        <asp:TextBox runat="server" ID="txt_dt_me" CssClass="form-control" />
                    </div>
                    <div class="col-lg-4 mb-2">
                        <span class="">Năm sinh Mẹ</span>
                        <asp:TextBox runat="server" ID="txt_ns_me" TextMode="Number" CssClass="form-control" />
                    </div>
                    <div class="col-lg-4 mb-2">
                        <span class="">Họ tên Vợ/Chồng</span>
                        <asp:TextBox runat="server" ID="txt_hoten_vc" CssClass="form-control" />
                    </div>
                    <div class="col-lg-4 mb-2">
                        <span class="">Dân tộc Vợ/Chồng</span>
                        <asp:TextBox runat="server" ID="txt_dt_vc" CssClass="form-control" />
                    </div>
                    <div class="col-lg-4 mb-2">
                        <span class="">Năm sinh Vợ/Chồng</span>
                        <asp:TextBox runat="server" ID="txt_ns_vc" TextMode="Number" CssClass="form-control" />
                    </div>
                </div>
            </div>
        </div>
        <div class="row mt-2">
            <div class="col-lg mb-2">
                <asp:Button Text="Lưu" ID="btn_save" OnClick="btn_save_Click" CssClass="btn btn-primary" runat="server" />
                <%--<asp:Button Text="Hủy" UseSubmitBehavior="false" ID="btn_cancel" OnClick="btn_cancel_Click" CssClass="btn btn-danger" runat="server" />--%>
            </div>
        </div>
    </ItemTemplate>
</asp:ListView>