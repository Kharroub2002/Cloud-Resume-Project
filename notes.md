# Personal Notes: Cloud Resume Project

## 1. The Architecture
*   **What we built**: A serverless static website.
*   **S3 Bucket**: Acts as the hard drive holding the HTML and CSS. We enabled "Static Website Hosting" so it behaves like a web server without us needing to manage a virtual machine (EC2).
*   **Terraform (IaC)**: We used code to tell AWS to create the bucket. This is crucial for DevOps interviews because it shows we can automate infrastructure, rather than clicking around the AWS Console ("ClickOps").

## 2. The Design (CSS Explained)
*   **Glassmorphism**: The central card has a "frosted glass" look. This is achieved in CSS using `backdrop-filter: blur(20px)` and a slightly transparent background `rgba(30, 41, 59, 0.7)`.
*   **Micro-animations**: Elements like the profile avatar have `transition: transform 0.4s ease`. When hovered over, it slightly scales up and rotates (`transform: scale(1.05) rotate(5deg)`).
*   **CSS Variables**: At the top of `style.css`, we defined `:root` variables (like `--primary: #38bdf8`). This makes it easy to change the entire color scheme later just by changing one line.

## 3. Core Terraform Commands to Remember
*   `terraform init`: Downloads the AWS plugin (creates the hidden `.terraform` folder).
*   `terraform plan`: Shows what will be built (The Dry Run/Safety Check).
*   `terraform apply`: Builds the resources in AWS.
*   `terraform destroy`: Deletes everything we built in AWS (useful to stop being billed).
