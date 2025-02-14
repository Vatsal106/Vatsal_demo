<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CourseWithImage.aspx.cs" Inherits="Vatsal.CourseWithImage" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title>Manage Courses</title>
    <style>
        .form-group { margin-bottom: 15px; }
        .grid img { width: 100px; height: auto; }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <h2>Manage Courses</h2>
            
            <div class="form-group">
                <label>Department:</label>
                <asp:DropDownList ID="ddlDept" runat="server" CssClass="form-control"></asp:DropDownList>
            </div>

            <div class="form-group">
                <label>Course Name:</label>
                <asp:TextBox ID="txtCourseName" runat="server" CssClass="form-control"></asp:TextBox>
            </div>

            <div class="form-group">
                <label>Course Image:</label>
                <asp:FileUpload ID="fileUpload" runat="server" />
            </div>

            <asp:Button ID="btnSubmit" runat="server" Text="Add Course" CssClass="btn btn-primary" OnClick="btnSubmit_Click" />

            <hr />

            <asp:GridView ID="gvCourses" runat="server" AutoGenerateColumns="true" CssClass="grid" CellPadding="5" GridLines="None">
                <Columns>
                    <%--<asp:BoundField DataField="course_id" HeaderText="ID" />
                    <asp:BoundField DataField="course_name" HeaderText="Course Name" />
                    <asp:BoundField DataField="dept_name" HeaderText="Department" />--%>
                    <asp:TemplateField HeaderText="Image" >
                        <ItemTemplate>
                            <img src='<%# ResolveUrl(Eval("Image").ToString()) %>' alt="Course Image" class="grid-img" />
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
        </div>
    </form>
</body>
</html>