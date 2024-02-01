# AdvancedReservationPicking for Dynamics 365 Business Central

## Overview

This repository contains the source code for the AdvancedReservationPicking project, a custom solution designed for Dynamics 365 Business Central. The project focuses on enhancing the warehouse picking process by prioritizing sales lines with reserved items in warehouse shipments. Our goal is to streamline warehouse operations and improve inventory control.

## Features

- Custom logic to create warehouse picks based on item reservations.
- A new action in the Warehouse Shipment page to trigger the custom picking process.
- Use of isolated storage to manage the state and trigger the custom process.

## Components

- **Codeunit 50100 "Warehouse Events"**: Subscribes to the `OnAfterCreateTempLineCheckReservation` event in the "Create Pick" codeunit, adjusting pick quantities based on reservations.
- **Page Extension 50100 "Warehouse Shipment"**: Adds a custom action to initiate the enhanced picking process.
- **Codeunit 50101 "Isolated Storage"**: Manages temporary data in isolated storage, acting as a control mechanism for triggering the custom process.

## Installation

1. Clone the repository to your local machine.
2. Import the objects into your Dynamics 365 Business Central environment.
3. Compile the objects and resolve any dependencies.
4. Activate the features through the custom action in the Warehouse Shipment page.

## Usage

The custom picking process can be initiated from the Warehouse Shipment page by clicking on the 'Create Pick (Only Reserved)' action. This action sets the necessary flags in isolated storage and triggers the custom logic implemented in the "Warehouse Events" codeunit.

## Contribution

Contributions to this project are welcome! Please read our [Contribution Guidelines](CONTRIBUTION.md) for more information on how to report issues, submit changes, and improve the code.

## License

This project is licensed under the [MIT License](LICENSE.md).

## Acknowledgements

Special thanks to all contributors and users of this project. Your feedback and suggestions have been invaluable in enhancing and refining the AdvancedReservationPicking solution.

## Learn More

For a more detailed explanation and insights into this project, please visit our [WordPress Post](https://ivansingleton.dev/revolutionizing-picking-in-business-central-a-focus-on-reservations/).
