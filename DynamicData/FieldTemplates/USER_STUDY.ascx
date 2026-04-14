<%@ Control Language="C#" CodeBehind="USER_STUDY.ascx.cs" Inherits="SDH_VICTORY.DynamicData.FieldTemplates.USER_STUDY" %>
<div class="card" >
    <div class="card-header bg-info text-white text-center">
        THÔNG TIN HỌC TẬP
    </div>
    <div class="card-body">
        <asp:ListView ID="lv_hoctap" runat="server" ItemPlaceholderID="pl_hoctap" OnItemDataBound="lv_hoctap_ItemDataBound">
            <LayoutTemplate >
                <div class="card mt-5 ">
                    <div class="card-body">
                        <div class="section-title mt-n5 d-flex ">
                            <p class="bg-white">LỚP HỌC</p>
                        </div>
                        <asp:PlaceHolder runat="server" ID="pl_hoctap" />
                    </div>
                </div>

            </LayoutTemplate>
            <ItemTemplate>
                <div class="row">
                    <div class="col-lg-6">
                        <asp:Label Text="" ID="lb_malop" runat="server" />
                    </div>
                    <div class="col-lg-6">
                        <asp:Label Text="" ID="lb_nienhoc" runat="server" />
                    </div>
                    <div class="col-lg-6">
                        <asp:Label Text="" ID="lb_manganh" runat="server" />
                    </div>
                    <div class="col-lg-6">
                        <asp:Label Text="" ID="lb_tennganh" runat="server" />
                    </div>
                    <div class="col-lg-6">
                        <asp:Label Text="" ID="lb_makhoa" runat="server" />
                    </div>
                    <div class="col-lg-6">
                        <asp:Label Text="" ID="lb_tenkhoa" runat="server" />
                    </div>
                </div>
            </ItemTemplate>
        </asp:ListView>
        
    </div>
</div>
