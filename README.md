<div align="center">
  <img src="assets/images/logo.png" alt="Petly Logo" width="120" />
  <h1>🐾 Petly</h1>
  <p><b>Your All-in-One Local-First Pet Companion App</b></p>
  
  <p>
    <a href="https://flutter.dev/"><img src="https://img.shields.io/badge/Flutter-02569B?style=for-the-badge&logo=flutter&logoColor=white" alt="Flutter" /></a>
    <a href="https://dart.dev/"><img src="https://img.shields.io/badge/Dart-0175C2?style=for-the-badge&logo=dart&logoColor=white" alt="Dart" /></a>
    <a href="https://riverpod.dev/"><img src="https://img.shields.io/badge/Riverpod-State_Management-blue?style=for-the-badge" alt="Riverpod" /></a>
    <a href="https://drift.simonbinder.eu/"><img src="https://img.shields.io/badge/Drift-SQLite-green?style=for-the-badge" alt="Drift" /></a>
  </p>
  <p>
    <img src="https://img.shields.io/badge/Platform-Android%20%7C%20iOS-lightgrey?style=flat-square" alt="Platforms" />
    <img src="https://img.shields.io/badge/License-MIT-blue.svg?style=flat-square" alt="License" />
    <img src="https://img.shields.io/badge/PRs-welcome-brightgreen.svg?style=flat-square" alt="PRs Welcome" />
  </p>
</div>

---

## 📖 About Petly

**Petly** is a beautiful, local-first mobile application built with Flutter, designed to help pet owners seamlessly manage their furry friends' health, care schedules, and expenses. 

With a stunning **glassmorphic** and **bento-grid UI** inspired by modern design principles, Petly keeps all your pet's data securely stored right on your device, ensuring complete privacy and offline accessibility.

<br/>

## 📱 App Preview

*(Add your app screenshots here by placing images in the `assets/images/screenshots/` folder)*

<table align="center">
  <tr>
    <td align="center"><img src="https://via.placeholder.com/250x500.png?text=Dashboard" width="250" alt="Dashboard" /><br/><b>Smart Dashboard</b></td>
    <td align="center"><img src="https://via.placeholder.com/250x500.png?text=Pet+Profile" width="250" alt="Pet Profile" /><br/><b>Bento Grid Profiles</b></td>
    <td align="center"><img src="https://via.placeholder.com/250x500.png?text=Calendar" width="250" alt="Calendar" /><br/><b>Interactive Calendar</b></td>
  </tr>
</table>

<br/>

## ✨ Key Features

### 🏥 Health & Medical
- **💊 Medicines & Reminders:** Log active and past prescriptions with Daily, Weekly, and Monthly recurrence tracking. Keep track of dosages and automatically see them on your calendar.
- **💉 Vaccinations & Dewormings:** Keep an active log of your pet's health history and view upcoming due dates dynamically inserted into your schedule.
- **📄 Medical History & Documents:** Log vet visits, surgeries, and conditions. Attach photos of prescriptions, vet bills, lab reports, and X-rays directly to the record for quick access.
- **🧬 Breeding Records:** Comprehensive breeding management. Dynamically tracks Heat Cycles, Mating dates, and Pregnancies (with auto-calculated expected due dates) for females, and maintains a detailed Stud Book for males. Seamlessly manage litter size and track newborns.
- **🩺 Emergency & Vet Contacts:** Maintain a dedicated dashboard of Veterinarians, Clinics, and Personal Emergency Contacts. Quickly launch Google Maps directions or dial numbers straight from the app with support for multiple phone numbers per contact.

### 📅 Organization & Planning
- **🐕 Comprehensive Pet Profiles:** Manage multiple pets with stunning dedicated profile screens featuring dynamic, color-coded bento grids. Now supports custom profile pictures, coat colors, sizes, and a dynamically synced live weight.
- **📆 Interactive Calendar Dashboard:** A fully interactive Google Calendar-style screen featuring a swipeable month grid and a unified timeline. It intelligently aggregates all your Appointments, Vaccinations, Dewormings, and smart Medication Schedules for any given day.
- **🥩 Food & Grooming Logs:** Record and manage daily feeding routines, preferred food brands, and grooming sessions. Log events with notes to keep a comprehensive care history.
- **📈 Growth Tracking:** Monitor your pet's weight over time to ensure they are growing healthy and strong. The pet's main profile automatically syncs to display the latest weight reading.

### ⚙️ System & Design
- **📸 Memories Gallery:** A Pinterest-style photo grid to save and look back on precious moments with your pets.
- **💰 Expense Management:** Track vet bills, food costs, and toys to stay on top of your pet-care budget.
- **💾 Secure Backup System:** Easily export your entire local database and images to a secure zip file to share or save to the cloud.
- **🎨 Glassmorphic UI:** A meticulously crafted, premium user interface featuring soft floating navigation bars, gorgeous gradients, and dynamic theming (Dark & Light mode support).
- **🔒 Local-First (Offline):** Powered by an embedded SQLite database (Drift). Your pet's sensitive medical data never leaves your device unless you choose to back it up.

<br/>

## 🛠️ Tech Stack

- **Framework:** [Flutter](https://flutter.dev/) (3.44+) / Dart
- **State Management:** [Riverpod](https://riverpod.dev/) (Reactive caching & dependency injection)
- **Local Database:** [Drift](https://drift.simonbinder.eu/) (Robust, type-safe SQLite ORM)
- **Routing:** [GoRouter](https://pub.dev/packages/go_router) (Declarative deep-linkable routing with nested Stateful Shells)
- **Design:** Material 3, Google Fonts (Geist & Inter)

<br/>

## 🚀 Getting Started

Follow these instructions to get a copy of Petly running on your local machine for development and testing.

### Prerequisites
- [Flutter SDK](https://docs.flutter.dev/get-started/install) installed
- A configured IDE (VS Code, Android Studio, or IntelliJ)
- An Android or iOS device / emulator

### Installation

1. **Clone the repository:**
   ```bash
   git clone https://github.com/Sarthak16082004/Petly.git
   cd Petly
   ```

2. **Install dependencies:**
   ```bash
   flutter pub get
   ```

3. **Generate Drift & Riverpod code:**
   Petly heavily relies on code generation for its database schema and providers.
   ```bash
   dart run build_runner build --delete-conflicting-outputs
   ```

4. **Run the app:**
   ```bash
   flutter run
   ```

<br/>

## 🏗️ Project Architecture

The app follows a feature-first architectural pattern to keep the codebase modular and scalable:

```text
lib/
 ├── app/               # App-wide configurations (Theme, Routing, App Shell)
 ├── core/              # Global utilities, DB configuration, extensions, shared widgets
 ├── features/          # Feature modules (Dashboard, Pets, Medicines, Vaccinations, etc.)
 │   ├── domain/        # Entities and repository interfaces
 │   ├── data/          # Drift implementations and local data sources
 │   └── presentation/  # UI screens, widgets, and Riverpod State Providers
 └── main.dart          # Application entry point
```

<br/>

## 🤝 Contributing

Contributions, issues, and feature requests are welcome! 
Feel free to check out the [issues page](https://github.com/Sarthak16082004/Petly/issues) if you want to contribute.

1. Fork the Project
2. Create your Feature Branch (`git checkout -b feature/AmazingFeature`)
3. Commit your Changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the Branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

---

<div align="center">
  <i>Made with ❤️ for Pets</i>
</div>
