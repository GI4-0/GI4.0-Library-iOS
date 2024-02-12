import SwiftUI
import UIKit
import GI40Lib

enum LibraryUsageExampleDefinition: CaseIterable {
    case search
    case scan
    case history
    
    var buttonTextResource: String {
        switch self {
        case .search:
            return NSLocalizedString("button_text_search_function", comment: "")
        case .scan:
            return NSLocalizedString("button_text_scan_function", comment: "")
        case .history:
            return NSLocalizedString("button_text_history_function", comment: "")
        }
    }
    
    func getViewController() -> UIViewController {
        let viewController: UIViewController
        switch self {
        case .search:
            viewController = SearchVC.create()
        case .scan:
            viewController = ScanVC.create()
        case .history:
            viewController = HistoryVC.create()
        }
        return viewController
    }
    
}

struct UIKitNavigation: UIViewControllerRepresentable {
      
    let definition: LibraryUsageExampleDefinition
      
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
      
    func makeUIViewController(context: Context) -> UINavigationController {
        let navigationController = UINavigationController()
        GI40Library.sharedInstance.initLib(navigationController: navigationController)
        let viewController = definition.getViewController()
        navigationController.pushViewController(viewController, animated: false)
        return navigationController
    }
  
    func updateUIViewController(_ uiViewController: UINavigationController, context: Context) {
        // Noop
    }
      
    class Coordinator: NSObject, UINavigationControllerDelegate {
        var parent: UIKitNavigation
  
        init(_ parent: UIKitNavigation) {
            self.parent = parent
        }
          
        func navigationController(_ navigationController: UINavigationController, willShow viewController: UIViewController, animated: Bool) {
            //navigationController.popViewController(animated: false)
            // Handle back navigation here.
        }
    }
}

class SheetState: ObservableObject {
    @Published var isPresented: Bool = false
    @Published var selectedDefinition: LibraryUsageExampleDefinition? = nil
      
    func present(_ definition: LibraryUsageExampleDefinition) {
        self.selectedDefinition = definition
        self.isPresented = true
    }
      
    func dismiss() {
        self.isPresented = false
    }
}

struct ContentView: View {
    @StateObject var sheetState = SheetState()
    
    var body: some View {
        VStack {
            ForEach(LibraryUsageExampleDefinition.allCases, id: \.self) { definition in
                Button(action: {
                    self.sheetState.present(definition)
                }) {
                    Text(definition.buttonTextResource)
                        .foregroundColor(.white)
                        .padding()
                        .background(Color.blue)
                        .clipShape(Capsule())
                }
                .padding(8)
            }
        }
        .padding()
        .sheet(isPresented: $sheetState.isPresented) {
            if let def = sheetState.selectedDefinition {
                UIKitNavigation(definition: def)
            }
        }
    }
}

#Preview {
    ContentView()
}
