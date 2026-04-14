<%@ Control Language="C#" CodeBehind="User_DVTT.ascx.cs" Inherits="SDH_VICTORY.DynamicData.FieldTemplates.User_DVTT" %>

<div class="card" >
    <div class="card-header bg-info text-white text-center">
        HỒ SƠ DỊCH VỤ TRỰC TUYẾN
    </div>
    <div class="card-body">
        <asp:ListView ID="lv_hoctap" runat="server" ItemPlaceholderID="pl_hoctap"
            OnItemDataBound="lv_hoctap_ItemDataBound">
           <LayoutTemplate>
               <asp:PlaceHolder runat="server" ID="pl_hoctap" />
           </LayoutTemplate>
            <ItemTemplate>
               <asp:Label Text="" ID="LB_LOAI_DVTT" runat="server" />
                <asp:GridView runat="server" CssClass="table table-sm table-bordered"  OnRowDataBound="GV_HSDANOP_RowDataBound"
                    ID="GV_HSDANOP" AutoGenerateColumns="false">
                    <Columns>
                        <asp:TemplateField HeaderText="STT"  ItemStyle-Width="10%">
                            <ItemTemplate>
                                <asp:Label Text='<%# Container.DataItemIndex + 1 %>' ID="btn_copy" runat="server" />
                            </ItemTemplate>
                            <ItemStyle HorizontalAlign="Center" />
                            <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Ngày nộp" ItemStyle-Width="15%" ItemStyle-HorizontalAlign="Center" >
                            <ItemTemplate>
                                <asp:Label Text="" ID="lb_ngaynop" runat="server" />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Trạng thái" ItemStyle-Width="15%" ItemStyle-HorizontalAlign="Center">
                            <ItemTemplate>
                                <asp:Label Text="" ID="lb_trangthai" runat="server" />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Nội dung phản hồi">
                            <ItemTemplate>
                                <asp:Label Text="" ID="lb_ndhs" runat="server" />
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                    <HeaderStyle HorizontalAlign="Center" />
                </asp:GridView>
            </ItemTemplate>
        </asp:ListView>
        
    </div>
</div>