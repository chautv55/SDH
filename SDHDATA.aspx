<%@ Page Language="C#" AutoEventWireup="true" Async="true" CodeBehind="SDHDATA.aspx.cs" Inherits="SDH_VICTORY.SDHDATA" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <div>
                Lệnh
                <asp:TextBox runat="server" ID="txt_sql" Width="100%" />
            </div>
            <div>
                <asp:Button Text="Run" ID="btn_run" OnClick="btn_run_Click" runat="server" />
            </div>
            <div>
                <p>Link Update Website</p>
                <%--<asp:TextBox runat="server" ID="txt_link" />--%>
            </div>
            <div>
                <asp:Button Text="Update" ID="btn_update" OnClick="btn_update_Click" runat="server" />
                <asp:Label ID="lblStatus" runat="server" Text=""></asp:Label>
            </div>
            <asp:GridView runat="server" ID="gv_datars"></asp:GridView>
        </div>

    </form>
</body>
</html>
