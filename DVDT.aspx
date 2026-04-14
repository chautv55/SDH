<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage_Index.Master" AutoEventWireup="true" CodeBehind="DVDT.aspx.cs" Inherits="SDH_VICTORY.DVDT" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="card">
        <div class="card-header card-header-tvu text-center text-yellow-tvu ">
            <b>CỔNG DỊCH VỤ ĐIỆN TỬ</b>
        </div>
        <div class="card-body border-0 menu-dvdt">
            <asp:ListView ID="lv_menu_dvdt" runat="server" OnItemDataBound="lv_menu_dvdt_ItemDataBound">
                <ItemTemplate>
                    <div class="row">
                        <div class="col-lg">
                            <asp:Label Text="" Font-Bold="true" ID="lb_nhom_menu" runat="server" />
                        </div>
                    </div>
                    <div class="row">
                        <asp:ListView runat="server" ID="lv_menu_dvdt" OnItemDataBound="lv_menu_dvdt_ItemDataBound1">
                            <ItemTemplate>
                                <div class="col-lg-6">
                                    <asp:LinkButton Text="" ID="link_menu" OnClick="btn_linkform_Click" runat="server" />
                                </div>
                            </ItemTemplate>
                        </asp:ListView>
                    </div>
                </ItemTemplate>
            </asp:ListView>
            <div class="row">
                <div class="col-lg resize">
                    <p><%--<a style="color:darkblue" href="LVDT3_2">Đăng ký tên đề tài, người hướng dẫn khoa học</a>--%></p>
                    <%--<p><a style="color:darkblue" href="#">!!!Xây dựng kế hoạch học tập cá nhân (NCS)</a></p>--%>
                    <%--<p><a style="color:darkblue" href="#">!!!Đăng ký bảo vệ đề cương chi tiết (NCS)</a> </p>--%>
                    <%--<p><a style="color:darkblue" href="LVTN5_2">Đăng ký xét tốt nghiệp</a>                 </p>--%>
                    <%--<p><a style="color:darkblue" href="DNHBSKT">Đăng ký học bổ sung kiến thức</a>          </p>--%>
                    <%--<p><a style="color:darkblue" href="#">!!!Đăng ký xét miễn giảm học phần</a>         </p>--%>
                </div>
                <div class="col-lg resize">
                    <p><%--<a style="color:darkblue" href="#">!!!Đăng ký học trước các học phần thạc sĩ đối với sinh viên</a>--%></p>
                    <%--<p><a style="color:darkblue" href="DNXNNH">Đề nghị xác nhận người học (Cao học, NCS)</a>               </p>
                    <p><a style="color:darkblue" href="DNXNHTDT">Đề nghị xác nhận hoàn thành chương trình đào tạo</a>        </p>
                    <p><a style="color:darkblue" href="DNXNTNTAMTHOI">Đề nghị xác nhận tốt nghiệp tạm thời</a>                    </p>
                    <p><a style="color:darkblue" href="DNCAPBD">Đăng ký cấp bảng điểm/ phụ lục văn bằng</a>                 </p>--%>
                    <%--<p><a style="color:darkblue" href="#">!!!Đăng ký cấp bảng sao văn bằng</a>                           </p>--%>
                    <%--<p><a style="color:darkblue" href="#">!!!Đăng ký xác nhận giảng day</a>                              </p>--%>
                    <%--<p><a style="color:darkblue" href="#">!!!Đăng ký xác nhận hướng dẫn</a>                              </p>--%>

                </div>
            </div>
        </div>
    </div>
    <section id="features" class="features">
        <div class="section-title">
            <h2>Dịch vụ điện tử</h2>
        </div>
        <asp:ListView runat="server" ID="lv_nhom_form" OnItemDataBound="lv_nhom_form_ItemDataBound">
            <ItemTemplate>
                <div class="card mt-4 border-primary">
                    <div class="card-body">
                        <div class="container" data-aos="fade-up">
                            <div class="section-title mt-n5 d-flex ">
                                <p class="bg-white">
                                    <asp:Label Text="" ID="lb_nhom_form" runat="server" />
                                </p>
                            </div>
                            <div class="row" data-aos="zoom-in" data-aos-delay="100">
                                <asp:ListView ID="lv_form_list" runat="server" OnItemDataBound="lv_form_list_ItemDataBound">
                                    <ItemTemplate>
                                        <div class="col-lg-4 col-md-4 mt-4">
                                            <div class="icon-box">
                                                <i id="html_i" runat="server" class="ri-file-list-3-line" ></i>
                                                <h3>
                                                    <asp:LinkButton  Text="" OnClick="btn_linkform_Click" ID="btn_linkform" runat="server" >

                                                    </asp:LinkButton>
                                                </h3>
                                            </div>
                                        </div>
                                    </ItemTemplate>
                                </asp:ListView>
                            </div>
                        </div>
                    </div>
                </div>
            </ItemTemplate>
        </asp:ListView>
        <div class="card border-info" style="display:none">
            <div class="card-body ">
                <div class="container" data-aos="fade-up">
                    <div class="section-title mt-n5 d-flex ">
                        <p class="bg-white">I Tuyển sinh</p>
                    </div>
                    <div class="row" data-aos="zoom-in" data-aos-delay="100">
                        <div class="col-lg-6 col-md-4 mt-4 mt-md-0 ">
                            <div class="icon-box">
                                <i class="fab fa-wpforms" style="color: #ffbb2c;"></i>
                                <h3><a href="">Phiếu đăng ký dự tuyển trình độ thạc sĩ</a></h3>
                            </div>
                        </div>
                        <div class="col-lg-6 col-md-4 mt-4 mt-md-0 ">
                            <div class="icon-box">
                                <i class="fab fa-wpforms" style="color: #5578ff;"></i>
                                <h3><a href="">Phiếu đăng ký học bổ sung kiến thức</a></h3>
                            </div>
                        </div>
                        <div class="col-lg-6 col-md-4 mt-4 ">
                            <div class="icon-box">
                                <i class="ri-calendar-todo-line" style="color: #e80368;"></i>
                                <h3><a href="">Phiếu đăng ký xét miễn giảm các học phần bổ sung kiến thức</a></h3>
                            </div>
                        </div>
                        <div class="col-lg-6 col-md-4 mt-4 ">
                            <div class="icon-box">
                                <i class="fab fa-wpforms" style="color: #e361ff;"></i>
                                <h3><a href="">Phiếu đăng ký dự thi tuyển sinh trình độ thạc sĩ</a></h3>
                            </div>
                        </div>

                    </div>

                </div>
            </div>
        </div>
        <br />
        <div class="card mt-4 border-primary" style="display:none">
            <div class="card-body">
                <div class="container" data-aos="fade-up">
                    <div class="section-title mt-n5 d-flex ">
                        <p class="bg-white">II Đào tạo</p>
                    </div>
                    <div class="row" data-aos="zoom-in" data-aos-delay="100">
                        <div class="col-lg-4 col-md-4 mt-4">
                            <div class="icon-box">
                                <i class="ri-file-list-3-line" style="color: #ffbb2c;"></i>
                                <h3><a href="LVDT2_1">Phiếu thông tin học viên</a></h3>
                            </div>
                        </div>
                        <div class="col-lg-4 col-md-4 mt-4">
                            <div class="icon-box">
                                <i class="ri-file-list-3-line" style="color: #5578ff;"></i>
                                <h3><a href="LVDT2_2">Phiếu đăng ký miễn giảm học phần Triết học</a></h3>
                            </div>
                        </div>
                        <div class="col-lg-4 col-md-4 mt-4">
                            <div class="icon-box">
                                <i class="fas fa-business-time" style="color: #e80368;"></i>
                                <h3><a href="LVDT2_3">Phiếu đề nghị bảo lưu kết quả học tập (chuyển điểm)</a></h3>
                            </div>
                        </div>
                        <div class="col-lg-4 col-md-4 mt-4">
                            <div class="icon-box">
                                <i class="far fa-calendar-times" style="color: #e361ff;"></i>
                                <h3><a href="LVDT2_4">Đơn xin nghỉ học tạm thời hoặc gia hạn thời gian học tập</a></h3>
                            </div>
                        </div>
                        <div class="col-lg-4 col-md-4 mt-4">
                            <div class="icon-box">
                                <i class="ri-file-list-3-line" style="color: #47aeff;"></i>
                                <h3><a href="LVDT2_5">Phiếu đăng ký học lại học phần</a></h3>
                            </div>
                        </div>
                        <div class="col-lg-4 col-md-4 mt-4">
                            <div class="icon-box">
                                <i class="ri-file-list-3-line" style="color: #47aeff;"></i>
                                <h3><a href="DNHBSKT">Phiếu đăng ký học bổ sung kiến thức</a></h3>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <br />

        <div class="card mt-4 border-primary" style="display:none">
            <div class="card-body">
                <div class="container" data-aos="fade-up">
                    <div class="section-title mt-n5 d-flex ">
                        <p class="bg-white">III Đề cương</p>
                    </div>
                    <div class="row" data-aos="zoom-in"  data-aos-delay="100">
                        <%--<div class="col-lg-4 col-md-4 mt-4" style="display:none">
                            <div class="icon-box">
                                <i class="ri-file-list-3-line" style="color: #ffbb2c;"></i>
                                <h3><a href="">Lý lịch khoa học dành cho giảng viên</a></h3>
                            </div>
                        </div>--%>
                        <div class="col-lg-4 col-md-4 mt-4">
                            <div class="icon-box">
                                <i class="ri-file-list-3-line" style="color: #5578ff;"></i>
                                <h3><a href="LVDT3_2">Phiếu đăng ký đề tài luận văn</a></h3>
                            </div>
                        </div>
                        <%--<div class="col-lg-4 col-md-4 mt-4" style="display:none">
                            <div class="icon-box">
                                <i class="fas fa-business-time" style="color: #e80368;"></i>
                                <h3><a href="">Thư mời hướng dẫn học viên thực hiện luận văn</a></h3>
                            </div>
                        </div>
                        <div class="col-lg-4 col-md-4 mt-4" style="display:none">
                            <div class="icon-box">
                                <i class="far fa-calendar-times" style="color: #e361ff;"></i>
                                <h3><a href="">Bản nhận xét, góp ý đề cương luận văn</a></h3>
                            </div>
                        </div>
                        <div class="col-lg-4 col-md-4 mt-4" style="display:none">
                            <div class="icon-box">
                                <i class="ri-file-list-3-line" style="color: #47aeff;"></i>
                                <h3><a href="">Biên bản họp Hội đồng xét duyệt đề cương luận văn </a></h3>
                            </div>
                        </div>
                        <div class="col-lg-4 col-md-4 mt-4" style="display:none">
                            <div class="icon-box">
                                <i class="ri-file-list-3-line" style="color: #47aeff;"></i>
                                <h3><a href="">Bản điều chỉnh, bổ sung đề cương luận văn </a></h3>
                            </div>
                        </div>--%>
                    </div>
                </div>
            </div>
        </div>
        <br />

        <div class="card mt-4 border-primary" style="display:none">
            <div class="card-body">
                <div class="container" data-aos="fade-up">
                    <div class="section-title mt-n5 d-flex ">
                        <p class="bg-white">IV Luận văn</p>
                    </div>
                    <div class="row" data-aos="zoom-in" data-aos-delay="100">
                        <div class="col-lg-4 col-md-4 mt-4">
                            <div class="icon-box">
                                <i class="ri-file-list-3-line" style="color: #ffbb2c;"></i>
                                <h3><a href="LVBV4_3">PHIẾU ĐĂNG KÝ ĐỀ TÀI LUẬN VĂN THẠC SĨ/ĐỀ ÁN </a></h3>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <br />

        <div class="card mt-4 border-primary" style="display:none">
            <div class="card-body">
                <div class="container" data-aos="fade-up">
                    <div class="section-title mt-n5 d-flex ">
                        <p class="bg-white">V Tốt nghiệp</p>
                    </div>
                    <div class="row" data-aos="zoom-in" data-aos-delay="100">
                        <div class="col-lg-4 col-md-4 mt-4">
                            <div class="icon-box">
                                <i class="ri-file-list-3-line" style="color: #ffbb2c;"></i>
                                <h3><a href="LVTN5_2">Đăng ký xét tốt nghiệp</a></h3>
                            </div>
                        </div>
                        <div class="col-lg-4 col-md-4 mt-4">
                            <div class="icon-box">
                                <i class="ri-file-list-3-line text-primary" ></i>
                                <h3><a href="DNXNHTDT">Phiếu đề nghị xác nhận hoàn thành chương trình đào tạo</a></h3>
                            </div>
                        </div>
                        <div class="col-lg-4 col-md-4 mt-4">
                            <div class="icon-box">
                                <i class="ri-file-list-3-line text-success" ></i>
                                <h3><a href="DNXNNH">Phiếu đề nghị xác nhận người học</a></h3>
                            </div>
                        </div>
                        <div class="col-lg-4 col-md-4 mt-4 ">
                            <div class="icon-box">
                                <i class="ri-file-list-3-line text-secondary"></i>
                                <h3><a href="DNXNTNTAMTHOI">Phiếu đề nghị xác nhận tốt nghiệp tạm thời</a></h3>
                            </div>
                        </div>
                        <div class="col-lg-4 col-md-4 mt-4">
                            <div class="icon-box">
                                <i class="ri-file-list-3-line text-danger" ></i>
                                <h3><a href="DNCAPBD">Phiếu đề nghị cấp bảng điểm phụ lục/văn bằng</a></h3>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
</asp:Content>
