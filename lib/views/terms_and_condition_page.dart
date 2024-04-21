import 'package:app/views/base_view.dart';
import 'package:app/widgets/back_app_bar.dart';
import 'package:flutter/material.dart';

class TermsAndConditionPage extends BaseView {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BackAppBar(
        height: MediaQuery.of(context).size.height * 0.20,
        widthGap: MediaQuery.of(context).size.width * 0.05,
        title: "Terms and Conditions",
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.symmetric(vertical: 50, horizontal: 100),
          padding: const EdgeInsets.all(16.0),
          child: const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Welcome to EASE-COMPLAINT, a web-based complaint filing and management system for Barangay Bonbon in Cagayan de Oro City. We are committed to providing efficient social services while respecting the confidentiality and privacy of our residents’ personal information. By using our platform, you agree to the following terms and conditions regarding confidentiality:',
                style: TextStyle(fontSize: 24),
              ),
              SizedBox(height: 18),
              Text(
                '• Confidentiality of Personal Information: We respect the confidentiality of all personal information provided by residents. This includes but is not limited to names, addresses, contact details, and any other sensitive information shared through the EASE-COMPLAINT platform.',
                style: TextStyle(fontSize: 16),
              ),
              Text(
                '• Restricted Access: Access to residents’ personal information is restricted to authorized staff members who are directly involved in the handling and resolution of complaints. Unauthorized access or sharing of personal information is strictly prohibited.',
                style: TextStyle(fontSize: 16),
              ),
              Text(
                '• Oath of Confidentiality: All staff members involved in the operation of EASE-COMPLAINT have taken an oath to uphold confidentiality. They are legally bound to maintain the privacy of residents’ personal information and are subject to disciplinary action and legal consequences for any breach of this confidentiality agreement.',
                style: TextStyle(fontSize: 16),
              ),
              Text(
                '• Data Security Measures: We implement robust security measures to safeguard residents’ personal information against unauthorized access, disclosure, alteration, or destruction. These measures include encryption, access controls, and regular security audits.',
                style: TextStyle(fontSize: 16),
              ),
              Text(
                '• Purpose of Information Collection: Personal information collected through EASE-COMPLAINT is used solely for the purpose of addressing and resolving complaints filed by residents. We do not use or share this information for any other purposes without explicit consent, except as required by law.',
                style: TextStyle(fontSize: 16),
              ),
              Text(
                '• Third-Party Disclosure: We do not sell, trade, or otherwise transfer residents’ personal information to third parties without their consent, except as required by law or in cases where disclosure is necessary to address a complaint effectively.',
                style: TextStyle(fontSize: 16),
              ),
              Text(
                '• Data Retention: We retain residents’ personal information only for as long as necessary to fulfill the purposes outlined in these terms and conditions or as required by law. Once the information is no longer needed, it will be securely deleted or anonymized.',
                style: TextStyle(fontSize: 16),
              ),
              Text(
                '• Updates to Terms and Conditions: We reserve the right to update or modify these terms and conditions regarding confidentiality at any time. Residents will be notified of any changes, and continued use of the EASE-COMPLAINT platform constitutes acceptance of the updated terms.',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 16),
              Text(
                'By using EASE-COMPLAINT, you acknowledge that you have read, understood, and agree to abide by these terms and conditions regarding confidentiality.',
                style: TextStyle(fontSize: 20),
              ),
              SizedBox(height: 16),
              Text(
                'Thank you for your cooperation in maintaining the privacy and confidentiality of residents’ personal information.',
                style: TextStyle(fontSize: 20),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
