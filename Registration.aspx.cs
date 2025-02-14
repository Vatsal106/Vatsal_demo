using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI.WebControls;

namespace Vatsal
{
    public partial class Registration : System.Web.UI.Page
    {
        dbConnection dbCon = new dbConnection();
        protected void Page_Load(object sender, EventArgs e)
        {

            if (!this.IsPostBack)
            {
                this.BindeGride();
                BindDdlDept();

            }
        }


        public void BindeGride()
        {

            dbCon.dbConnect();
            string query = "SELECT * FROM tbl_Dept";
            SqlDataAdapter sda = new SqlDataAdapter(query, dbCon.con);
            DataSet dt = new DataSet();
            sda.Fill(dt);
            gvDept.DataSource = dt;
            gvDept.DataBind();
            dbCon.con.Close();
        }
        protected void btnSubmit_Click(object sender, EventArgs e)
        {

            string name = txtName.Text;
            string phone = txtPhone.Text;
            string email = txtEmail.Text;
            string gender = rblGender.SelectedValue;
            //string[] social = new string[cblSocial.Items.Count];   
            string city = ddlCity.SelectedValue;
            string dob = txtDate.Text;
            string address = txtAddress.Text;
            //for (int i = 0; i < cblSocial.Items.Count; i++)
            //{
            //    if (cblSocial.Items[i].Selected)
            //    {
            //        social[i] = cblSocial.Items[i].Value;
            //    }
            //}
            List<string> selectedSocialMedia = new List<string>();
            foreach (ListItem item in cblSocial.Items)
            {
                if (item.Selected)
                {
                    selectedSocialMedia.Add(item.Value);
                }
            }
            string socialMediaDetails = "";
            for (int i = 0; i < selectedSocialMedia.Count; i++)
            {
                socialMediaDetails += selectedSocialMedia[i];
                if (i < selectedSocialMedia.Count - 1)
                {
                    socialMediaDetails += ", ";
                }
            }
            // Display the details
            lblDetails.Text = $"<h3>Details</h3><br />" +
                               $"<b>Name:</b> {name}<br />" +
                              $"<b>Phone:</b> {phone}<br />" +
                              $"<b>Email:</b> {email}<br />" +
                              $"<b>Gender:</b> {gender}<br />" +
                              $"<b>Social Media:</b> {socialMediaDetails}<br />" +
                              $"<b>City:</b> {city}<br />" +
                              $"<b>Date of Birth:</b> {dob}<br />" +
                              $"<b>Address:</b> {address}";
            //MessageBox.Show(lblDetails.Text);


        }

        protected void btnReset_Click(object sender, EventArgs e)
        {
            txtName.Text = string.Empty;
            txtPhone.Text = string.Empty;
            txtEmail.Text = string.Empty;
            txtDate.Text = string.Empty;
            txtAddress.Text = string.Empty;

            // Reset RadioButtonList
            if (rblGender.Items.Count > 0)
            {
                rblGender.ClearSelection();
            }
            ddlCity.ClearSelection();

        }
        protected void BindDdlDept()
        {
            dbCon.dbConnect();
            string query = "select * from tbl_dept";
            SqlDataAdapter sda = new SqlDataAdapter(query, dbCon.con);
            DataSet ds = new DataSet();
            ddlDept.DataSource = ds;
            sda.Fill(ds);
            ddlDept.DataTextField = "dept_name";
            ddlDept.DataValueField = "dept_id";
            ddlDept.DataBind();
            dbCon.con.Close();

        }
        protected void ddlDept_SelectedIndexChanged(object sender, EventArgs e)
        {

            dbCon.dbConnect();
            string selected = ddlDept.SelectedValue;
            string query = "select * from tbl_course where dept_id='" + selected + "'";
            SqlDataAdapter sda = new SqlDataAdapter(query, dbCon.con);
            DataSet ds = new DataSet();
            ddlCourse.DataSource = ds;
            sda.Fill(ds);
            //ddlDept.DataBind();
            ddlCourse.DataTextField = "course_name";
            ddlCourse.DataValueField = "course_id";

            ddlCourse.DataBind();
            dbCon.con.Close();
        }
    }
}