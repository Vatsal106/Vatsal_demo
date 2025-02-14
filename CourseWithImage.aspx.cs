using System;
using System.Data;
using System.Data.SqlClient;
using System.IO;

namespace Vatsal
{
    public partial class CourseWithImage : System.Web.UI.Page
    {
        dbConnection dbCon = new dbConnection();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadDepartments();
                LoadCourses();
            }
        }

        private void LoadDepartments()
        {
            dbCon.dbConnect();

            SqlCommand cmd = new SqlCommand("SELECT dept_id, dept_name FROM tbl_Dept", dbCon.con);

            SqlDataReader reader = cmd.ExecuteReader();
            ddlDept.DataSource = reader;
            ddlDept.DataTextField = "dept_name";
            ddlDept.DataValueField = "dept_id";
            ddlDept.DataBind();

        }

        private void LoadCourses()
        {
            dbCon.dbConnect();
            SqlDataAdapter da = new SqlDataAdapter(
                    "SELECT c.course_id, c.course_name, d.dept_name, c.Image FROM tbl_Course c " +
                    "JOIN tbl_Dept d ON c.dept_id = d.dept_id", dbCon.con);
            DataTable dt = new DataTable();
            da.Fill(dt);
            gvCourses.DataSource = dt;
            gvCourses.DataBind();

        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            string courseName = txtCourseName.Text;
            int deptId = int.Parse(ddlDept.SelectedValue);
            string imagePath = "";

            if (fileUpload.HasFile)
            {
                string fileName = Path.GetFileName(fileUpload.PostedFile.FileName);
                imagePath = "~/Images/" + fileName;
                fileUpload.SaveAs(Server.MapPath(imagePath));
            }
            dbCon.dbConnect();

            string query = "INSERT INTO tbl_Course (course_name, dept_id, Image) VALUES (@name, @dept, @image)";
            SqlCommand cmd = new SqlCommand(query, dbCon.con);
            cmd.Parameters.AddWithValue("@name", courseName);
            cmd.Parameters.AddWithValue("@dept", deptId);
            cmd.Parameters.AddWithValue("@image", imagePath);


            cmd.ExecuteNonQuery();


            LoadCourses(); // Refresh GridView
        }
    }
}