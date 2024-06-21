# Auto-Reserve

## Overview
This repository contains the source code for "BC-Auto-Reserve," a streamlined solution for optimizing inventory reservations in Dynamics 365 Business Central. This project focuses on reserving only the available items in the Item Ledger Entries, ensuring a more accurate and efficient reservation process.

## Features
- Targeted auto-reservation that excludes Purchase Orders and other sources.
- Customizable codeunit to handle the reservation process.
- Simplifies inventory management by reserving only immediately available items.

## Components
- **Codeunit "Auto Reserve Management"**: Main orchestrator for the auto-reservation process.
- **Procedure "AutoReserveSalesOrderLines"**: Handles the reservation of sales order lines.
- **Procedure "ShouldReserveSalesLine"**: Determines if a sales line should be reserved.
- **Procedure "ReserveSalesLine"**: Manages the actual reservation of a sales line.
- **Procedure "ShowCompletionMessage"**: Displays a message upon completion of the reservation process.

## Usage
To implement targeted auto-reservation in Business Central, integrate the provided codeunit and procedures. This will allow you to reserve only the available items from the Item Ledger Entries, enhancing the efficiency of your inventory management.

## Video
[Watch the video demonstration](https://github.com/ivanrlg/AutoReserve/assets/21310111/a6746dbe-eabd-4483-9670-66299829c88e)

## Contribution
Contributions to this project are welcome! If you have suggestions for improvements or have found issues, please follow our Contribution Guidelines.

## License
This project is available under the MIT License - see the LICENSE.md file for details.

## Acknowledgements
Special thanks to Dmitry Katson for his inspiring work, which formed the foundation for further exploration in this project. Additionally, gratitude to the community and all contributors for their support and input.

## Learn More
For a comprehensive understanding of how this project was conceived and developed, please refer to the detailed blog post on [Optimizing Sales Order Reservations in Business Central: Focusing on Item Ledger Entries](https://ivansingleton.dev/optimizing-sales-order-reservations-in-business-central-focusing-on-item-ledger-entries/).

## Additional Notes
This project simplifies the reservation process within Business Central, focusing solely on available inventory. By targeting only the Item Ledger Entries, it ensures more accurate and efficient reservations. As technology evolves, this approach can be expanded and improved. I welcome feedback and further development, hoping this method will enhance inventory management practices in Business Central. Visit our [GitHub repository](https://github.com/ivanrlg/AutoReserve) to explore the code and contribute.
