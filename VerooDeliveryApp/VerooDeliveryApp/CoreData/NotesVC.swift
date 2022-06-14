//
//  ViewController.swift
//  VerooDeliveryApp
//
//  Created by Aparna Tati on 14/06/22.
//

import UIKit

class NotesVC: BaseViewController<NotesCoordinator, BaseViewModel> {
    
    // MARK: Variables
    let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext
    var notesData = [Notes]()
    
    // MARK: Outlets
    @IBOutlet weak var tblNotes: UITableView!
    
    // MARK: Overridden Method
    override func viewDidLoad() {
        super.viewDidLoad()
        title = R.string.localizable.tvTitle()
        navigationItem.title = R.string.localizable.tvTitle()
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(didAddTap))
        navigationItem.rightBarButtonItem?.tintColor = R.color.labelTextColor()
        getItems()
    }
    
    @objc func didAddTap() {
        let alert = UIAlertController(title: R.string.localizable.addItemTitle(), message: R.string.localizable.addItemMessage(), preferredStyle: .alert)
        alert.addTextField(configurationHandler: nil)
        alert.addAction(UIAlertAction(title: R.string.localizable.addAction(), style: .cancel,  handler: { [weak self] _ in
            guard let fieldData = alert.textFields?.first, let text = fieldData.text, !text.isEmpty else {
                return
            }
            self?.createItem(item: text)
        }))
        present(alert, animated: true)
    }
    
    ///This is the function for get items
    func getItems() {
        guard let data = try? context?.fetch(Notes.fetchRequest()) else { return }
        notesData = data
        DispatchQueue.main.async {
            self.tblNotes.reloadData()
        }
    }
    
    ///This is the function for creates item
    func createItem(item: String) {
        guard let context = context else { return }
        let newItem = Notes(context: context)
        newItem.name = item
        newItem.createdAt = Date()
        do {
            try context.save()
            getItems()
        } catch {
            print(error)
        }
    }
    
    ///This is the function for update item
    func updateItem(item: Notes, newItem: String) {
        item.name = newItem
        do {
            try context?.save()
            getItems()
        } catch {
            print(error)
        }
    }
    
    ///This is the function for delete item
    func deleteItem(item: Notes) {
        context?.delete(item)
        do {
            try context?.save()
            getItems()
        } catch {
            print(error)
        }
    }
    
}

// MARK: Extension of NotesVC conforming UITableViewDelegate, UITableViewDataSource protocol
extension NotesVC: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return notesData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tblNotes.dequeueReusableCell(withIdentifier: R.reuseIdentifier.notesCell.identifier) as? NotesCell else { return UITableViewCell() }
        NotesCell.cellConfiguration(cell: cell, indexPath: indexPath, data: notesData)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let item = notesData[indexPath.row]
        let sheet = UIAlertController(title: R.string.localizable.sheetTitle(), message: nil, preferredStyle: .actionSheet)
        sheet.addAction(UIAlertAction(title: R.string.localizable.cancelTitle(), style: .cancel,  handler: nil))
        sheet.addAction(UIAlertAction(title: R.string.localizable.editTitle(), style: .default,  handler: { _ in
            let alert = UIAlertController(title: R.string.localizable.editActionTitle(), message: R.string.localizable.editActionMessage(), preferredStyle: .alert)
            alert.addTextField(configurationHandler: nil)
            alert.textFields?.first?.text = item.name
            alert.addAction(UIAlertAction(title: R.string.localizable.editButtonTitle(), style: .cancel,  handler: { [weak self] _ in
                guard let fieldData = alert.textFields?.first, let newItem = fieldData.text, !newItem.isEmpty else {
                    return
                }
                self?.updateItem(item: item, newItem: newItem)
            }))
            self.present(alert, animated: true)
        }))
        sheet.addAction(UIAlertAction(title: R.string.localizable.deleteTitle(), style: .destructive,  handler: { _ in
            self.deleteItem(item: item)
        }))
        present(sheet, animated: true)
    }

}
